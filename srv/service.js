
// const SapCfAxios = require('sap-cf-axios').default;

// const ValidationDestination = SapCfAxios('ValidationAPI');
const { tx } = require('@sap/cds');
const axios = require('axios');

module.exports = async function () {


    // Vihaan Entities-------------------------------------------->
    const { SupplierReqSrv, SReqattachmentsSrv, SeqTrackerSrv } = this.entities;
    const ValidationAPI = await cds.connect.to('ValidationAPI');

    // Attachments-------------------------------------------->
    this.before('CREATE', SReqattachmentsSrv, BeforeAttachmentUpload);
    this.on('CREATE', SReqattachmentsSrv, OnAttachmentsUpload);

    // request Services

    this.before('CREATE', SupplierReqSrv, BeforeSupReqFun);




    this.on('CREATE', SupplierReqSrv, OnSupReqFun);
    // this.after('CREATE', supplierReqSrv, AfterSupReqFun);


    this.on('DoValidation', onValidationAPI);
    this.on('ValidatePAN', onValidatingPAN);
    this.on('ValidateGST', onValidatingGST);


    // functions-------------------------------------------->

    //1. Before supplier req form
    async function BeforeSupReqFun(req, res) {
        const { Status } = req.data;

        if (!Status) {
            req.error(400, "Please provide a valid Status (DRAFT or SUBMIT).");
            return;
        }
        if (Status === 'DRAFT') {
            console.log("Processing as DRAFT...");
            await BeforeSavingSupReqFun(req);
        } else if (Status === 'SUBMIT') {
            console.log("Processing as SUBMIT...");
            await MandatoryFieldsCheck(req);
        } else {
            req.error(400, `Invalid Status '${Status}' provided. Allowed values are DRAFT or SUBMIT.`);
        }
    };

    //2. Before supplier saving form
    async function BeforeSavingSupReqFun(req, res) {
        console.log("I am in BeforeSaving");

        const {
            DigressionVCodeUpto,
            PANCardNo,
            GSTIN,
        } = req.data;




        await ValCheck(DigressionVCodeUpto, GSTIN, PANCardNo, req);

    };

    async function OnSupReqFun(req, res) {
        const tx = cds.tx(req)
        try {
            const { ReqID, LastSeq } = await generateReqID(tx);

            req.data.SupplierReqID = ReqID;


            await tx.run([
                INSERT.into(SupplierReqSrv).entries(req.data)

            ]).then(async (resolve, reject) => {
                if (typeof (resolve) !== 'undefined') {

                    try {
                        await UpdateLastSequence(ReqID, LastSeq, tx);
                    } catch (error) {
                        throw new Error(`Failed to update sequence: ${error.message}`);
                    }
                    return req.data;
                } else {
                    req.error(500, 'There is an error on Inserting Data the Supplier Request Form');
                }
            }).catch(err => {
                console.log(err);
                req.error(500, "There is an error " + err.toString());
            })
            await tx.commit();
            return req.data;
        } catch (error) {
            await tx.rollback();
            console.error('Error in OnSavingSupReqFun:', error);
            req.error(500, `Failed to save Supplier Request Form: ${error.message}`);


        }



    };

    //After supplier Req Fun We are triggering the workflow
    async function AfterSupReqFun(req, res) {

        const {

            SFullName,

        } = res.data;
        let ReqID = res.data.ID;

        try {


            const apprwf = await cds.connect.to("spa_process_destination");

            let workflowData = JSON.stringify({
                "definitionId": "us10.fd8df7c4trial.vihaanworkflow.approvalProcess",
                "context": {
                    "reqid": ReqID,
                    "approveremail": "sumitracxam@gmail.com",
                    "sfullname": SFullName

                }
            });
            console.log(workflowData);

            const wfResponse = await apprwf.post('/workflow-instances', workflowData, {
                headers: {

                    'Content-Type': 'application/json'

                }
            });

            console.log('Workflow Triggered', wfResponse);
        } catch (error) {
            console.error('Workflow Trigger Error:', error);
            throw error;
        }
    }

    //On Attachment Upload...
    async function OnAttachmentsUpload(req, res) {
        const { content: base64Content, ...rest } = req.data;
        if (base64Content) {
            const binaryContent = Buffer.from(base64Content.split(',')[1], 'base64');
            rest.content = binaryContent;
        }
        await INSERT.into(SReqattachmentsSrv).entries(rest);

        return req.data;

    }

    //Before Attachment Upload
    async function BeforeAttachmentUpload(req, res) {

        if (req.data.content && req.data.content.length > 0) {
            console.log("Uploading file of size:", req.data.content.length);
        }
        req.data.url = `/odata/v2/attachments/SReqattachmentsSrv(${req.data.ID})/content`;

    }

    async function onGSTValidation(req, res) {

        try {
            const response = await axios.get('?email=vikrant.raj@gmail.com&gstin=33GSPTN1351G1ZF', {
                headers: {
                    'client_id': '169e8939-4d76-4230-b4c5-935f3f4453ce',
                    'client_secret': '51c2ad52-03db-4731-a660-af9131b42d6d',
                    'Content-Type': 'application/json'
                }
            });
            return response.data;
        } catch (error) {
            console.error('Error calling GST API:', error);
            return false;
        }

    };

    //Validation api
    async function onValidationAPI(req, res) {

        try {
            const response = await axios.post(`${ValidationAPI.options.credentials.url}/mock/auth`,
                {},
                {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                        'x-api-key': 123
                    }
                },
            );


            return response.data;

        } catch (error) {
            console.log("Validation API is throwing an error: " + error.message);
            return req.error({

                status: 500
            })

        }
    }



    // service end
    async function ValCheck(DigressionVCodeUpto, GSTIN, PANCardNo, req) {

        const currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0);


        const afterFourYearDate = new Date();
        afterFourYearDate.setFullYear(currentDate.getFullYear() + 4);
        afterFourYearDate.setHours(0, 0, 0, 0);



        const ValdityDate = new Date(DigressionVCodeUpto);
        ValdityDate.setHours(0, 0, 0, 0);


        if (ValdityDate < currentDate) {
            req.error(400, "Validity Digression Date must be greater than the current date");
        }
        if (ValdityDate > afterFourYearDate) {
            req.error(400, 'Validity Digression Date cannot be more than four years');
        }


        const GSTIN_match = GSTIN.substring(2, 12);
        if (GSTIN_match !== PANCardNo) {
            req.error(400, "GST's digits from 3 to 10 should exactly match!!");
        };


    };

    async function MandatoryFieldsCheck(req) {

        const {
            DigressionVendorCodeVal,
            IsRelPartyVCode,
            SpendType,
            NatureOfActivity,
            Sector,
            FunAndSubfun,
            PANCardNo,
            GSTIN,
            SFullName,
            STradeNameGST,
            SAddress,
            SAddressGST,
            PriContactFName,
            PriContactLName,
            PriContactEmail,
            PriContactMNumber,
            Status
        } = req.data;

        const mandatoryFields = {
            DigressionVendorCodeVal,
            IsRelPartyVCode,
            SpendType,
            NatureOfActivity,
            Sector,
            FunAndSubfun,
            PANCardNo,
            GSTIN,
            SFullName,
            STradeNameGST,
            SAddress,
            SAddressGST,
            PriContactFName,
            PriContactLName,
            PriContactEmail,
            PriContactMNumber,

        };
        console.log("REQID" + req.ID);


        const missingFields = Object.keys(mandatoryFields).filter(field => !mandatoryFields[field] || mandatoryFields[field].length === 0);
        if (missingFields.length) {
            req.error(400, `Following field must be provided :${missingFields.join(', ')}`);

        }
        //function call
        await ValCheck(DigressionVendorCodeVal, GSTIN, PANCardNo, req);


    };

    //Generation the REQID
    async function generateReqID(tx) {


        let LastSeq = await GetLastSequence(tx);


        let base = "R"
        let maxlen = 8;
        let noOfDigit = LastSeq === 0 ? 1 : Math.floor(Math.log10(LastSeq)) + 1;


        let zeros = "0".repeat(maxlen - noOfDigit);
        let ReqID = base + zeros + (LastSeq + 1);


        return { ReqID, LastSeq };

    };

    async function GetLastSequence(tx) {

        const result = await tx.run(
            SELECT.one('MAX(LastSeq) AS LastSeq').from(SeqTrackerSrv)
        )
        let LastSeq = result.LastSeq;
        if (LastSeq === null) {
            LastSeq = 0;
        }
        return LastSeq;

    };

    async function UpdateLastSequence(ReqID, LastSeq, tx) {

        await tx.run(
            INSERT.into(SeqTrackerSrv).entries({
                TrackerID_SupplierReqID: ReqID, // Incorrect field to simulate error
                LastSeq: LastSeq + 1            // Increment the sequence for the new record
            })
        );

    };
    //End of Generation of REQID



    //PAN GST VALIDATIONS


    async function onValidatingPAN(req) {


        const { pan } = req.data;

        const results = await onValidationAPI(req);
        const token = results.results.auth_token; 
        console.log("Token retrieved:", token);


        if (!token) {
            req.error(400, 'No authorization token received.');
            return;
        }

        try {

            const url = `${ValidationAPI.options.credentials.url}/mock/kyc/sync/pan?pan=${encodeURIComponent(pan)}`;

            const response = await axios.post(
                url,
                {}, 
                {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                }
            );


            console.log("Response data:", response.data);

            if (response.data && response.data.results) {
                console.log("PAN validation response:", response.data.results);
                return JSON.stringify(response.data);
            } else {

                req.error(400, 'PAN validation failed: No data returned from API.');
            }
        } catch (error) {
            console.error('Error during PAN validation:', error.response ? error.response.data : error.message);

            if (error.response) {
                console.error('Error status:', error.response.status);
                console.error('Error response body:', error.response.data);
            }

            req.error(500, `PAN validation failed: ${error.response ? error.response.data : error.message}`);
        }
    };



    async function onValidatingGST(req) {
        const { gst } = req.data;

        try {
            const url = `${ValidationAPI.options.credentials.url}/gst?gst=${gst}`;
            const response = await axios.post(
                url,
                {},
                {
                    headers: {
                        'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE', // Replace with your token
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                }
            );

            if (response.data && response.data.results) {
                return JSON.stringify(response.data.results);
            } else {
                req.error(400, 'GST validation failed: No data returned from API.');
            }
        } catch (error) {
            console.error('Error during GST validation:', error.message);
            req.error(500, `GST validation failed: ${error.message}`);
        }



    };



};




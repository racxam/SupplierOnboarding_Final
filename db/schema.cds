namespace supplierOnboardingdb;

using {
    cuid,
    managed
} from '@sap/cds/common';

using {common.db as common} from './master';

context transcation {

    entity supplier_request : managed, {
            // Supplier Identification
        key SupplierReqID                        : String(10);
            SupplierSpendType                    : common.SupplierSpendT;
            SupplierType                         : common.SupplierT;
            VCodeCreateReqType                   : common.VCodeCreateReqT;
            SupplierJustification                : common.TextMultiple;
            ExistingVendorCode                   : common.TextLimited;
            ROVCreationReason                    : common.ROVCreationReasonT;
            ClosingROVVCode                      : common.TextLimited;
            MMRelatedPartyVendorCode             : Boolean;
            NatureOfActivity                     : common.NatureOfActivityT;
            CompanyCode                          : common.TextLimited; //feteched from SAP table
            VendorPlantCode                      : common.TextLimited;
            ReqVendorCode                        : common.TextLimited;
            DigressionVCodeUpto                  : Date; //Digression Vendor code date
            Sector                               : array of common.SectorT;
            Department                           : array of common.DepartmentT;
            FunAndSubFun                         : array of common.funAndSubFunT;
            //Requirement Section
            PANCardNo                            : common.PanCardT;
            GSTIN                                : common.GstInT; //gst no.
            Attachments                          : Association to many sreq_attachments
                                                       on Attachments.Req_Supplier = $self; //Additional Documents,Supplier Assment Form, Vendor Evaluation Form, Diligence Check Supporting Docs, International Sanction Document,   //Additional Attachment of Addtional Information Section
            GSTStatus                            : common.GSTStatusT;
            AddComments                          : common.TextLimited;

            //General Supplier Information S means -Supplier

            SFullName                            : common.TextLimited;
            STradeNameGST                        : common.TextLimited;
            SAddress                             : common.TextMultiple; // Supplier Address
            SAddressGST                          : common.TextMultiple; // Supplier Address (GST)

            //Primary Supplier Contact
            PriContactFName                      : common.TextLimited; // Primary Contact First Name
            PriContactLName                      : common.TextLimited; // Primary Contact Last Name

            PriContactEmail                      : common.TextLimited; // It needs validation
            PriContactMNumber                    : common.TextLimited; // Needs validation


            Status                               : common.StatusT default 'DRAFT'; //Status
            //Purchasing Data

            GroupSupplier                        : common.TextLimited; // will be updated
            IsGroupNotAval                       : Boolean;
            NewGroup                             : common.TextLimited;
            ParentSupplier                       : common.TextLimited; //will be updated
            IsParentNotAval                      : Boolean;
            NewParent                            : common.TextLimited;
            AccountGroup                         : common.AccGroupT;
            SupAssesment                         : Boolean; // need a form also Supplier Assment Form

            SearchTermOne                        : common.TextLimited;
            SupDueDiligenceCheck                 : common.DiligenceCheckT;
            RemarkDueDiligence                   : common.TextLimited;
            //Purchasing Information
            PurchasOrg                           : common.PurchOrgT;
            PurchasOrderCurrCode                 : common.PurchasOrderCurrCodeT;
            //Additional Information
            VendorCodeAnotherAdd                 : Boolean;
            VendorCode                           : common.TextLimited;
            DomesticSchema                       : common.DomesticSchemaT;
            ImportSchema                         : common.ImportSchemaT;
            PurBlockIndicator                    : Boolean;
            //Additional Attachment of Addtional Information Section

            //Payments
            PaymentTerms                         : common.TextLimited;
            IncotermsCode                        : common.TextLimited;
            IncotermsLocation                    : common.TextLimited;


            //Supplier on boarding from here
            //1. Attachment will be Code of Coduct Decleation of M&M

            //Section-Mahindra & Mahindra Supplier Code of Conduct (COC) Declaration
            AcceptCodeOfConduct                  : Boolean;
            //Attachment 1

            IsOwnerExEmployee                    : Boolean;
            HasBloodRelationWithEmployee         : Boolean;
            IsRelatedPartyVendor                 : Boolean;
            SupplierFullLegalName                : String(255);
            PanCardAttachment                    : String(1000); // Attachments;


            SupplierFullLegalNameGst             : String(255);
            SupplierTradeNameGst                 : String(255);
            SupplierPrimaryAddressGst            : String(255);
            GstAddressAdditional                 : String(255);
            GstRegistrationCertificate           : String(1000); // Attachments;
            EInvoiceApplicability                : Boolean;
            GstrFiler                            : String(255);
            RegistrationTaxID                    : String(255);
            NameOfRegistrationTaxID              : String(255);
            RegistrationTaxIDAttachment          : String(1000); // Attachments;
            TurnoverSlab                         : String(255);
            IsCinApplicable                      : Boolean;
            CinNo                                : String(12);
            CinAttachment                        : String(1000); // Attachments;
            LlpRegistrationNo                    : String(12);
            LlpRegistrationCertificate           : String(1000); // Attachments;
            InternationalRegistrationName        : String(255);
            InternationalRegistrationTaxID       : String(255);
            IsTanApplicable                      : Boolean;
            TanNumber                            : String(255);
            TanRegistrationCertificate           : String(1000); // Attachments;
            EpfoNumber                           : String(255);
            EpfoCertificate                      : String(1000); // Attachments;
            DunsNumber                           : String(9);
            LeiNumber                            : String(255);
            LeiCertificate                       : String(1000); // Attachments;
            ReasonNotRegisteredGst               : String(255);
            MsmeRegistrationApplicable           : Boolean;
            UdyamNumber                          : String(255);
            MsmeEnterpriseName                   : String(255);
            MsmeType                             : String(255);
            MsmeCertificate                      : String(1000); // Attachments;
            IndustryType                         : String(255);
            CountryCode                          : String(10);
            PrimaryContactFirstName              : String(255);
            PrimaryContactLastName               : String(255);
            PrimaryContactEmail                  : String(255);
            PrimaryContactMobileNumber           : String(255);
            //Additional Informationss
            VendorType                           : String(255);
            AcceptDsa                            : Boolean;
            UploadDsa                            : String(1000); // Attachments;
            UploadNda                            : String(1000); // Attachments;
            IsoTSCertificate                     : Boolean;
            UploadIsoTsCertificate               : String(1000); // Attachments;
            IsoTSCertificateNumber               : String(255);
            IsoTsExpiryDate                      : DateTime;
            IsoCertificates                      : String(255);
            Iso9001Certificate                   : Boolean;
            UploadIso9001Certificate             : String(1000); // Attachments;
            Iso9001CertificateNumber             : String(255);
            Iso9001ExpiryDate                    : DateTime;
            Iso16949Certificate                  : Boolean;
            UploadIso16949Certificate            : String(1000); // Attachments;
            Iso16949CertificateNumber            : String(255);
            Iso16949ExpiryDate                   : DateTime;
            Iso14001Certificate                  : Boolean;
            UploadIso14001Certificate            : String(1000); // Attachments;
            Iso14001CertificateNumber            : String(255);
            Iso14001ExpiryDate                   : DateTime;
            Iso45001Certificate                  : Boolean;
            UploadIso45001Certificate            : String(1000); // Attachments;
            Iso45001CertificateNumber            : String(255);
            Iso45001ExpiryDate                   : DateTime;
            FactoryLicense                       : Boolean;
            UploadFactoryLicense                 : String(1000); // Attachments;
            FactoryLicenseNumber                 : String(255);
            FactoryLicenseExpiryDate             : DateTime;
            ConsentToOperateCertificate          : Boolean;
            UploadConsentToOperateCertificate    : String(1000); // Attachments;
            ConsentToOperateCertificateNumber    : String(255);
            ConsentToOperateExpiryDate           : DateTime;
            FireNOCertificate                    : Boolean;
            UploadFireNOCertificate              : String(1000); // Attachments;
            FireNOCertificateNumber              : String(255);
            FireNOCertificateExpiryDate          : DateTime;
            WageAgreementCertificate             : Boolean;
            UploadWageAgreementCertificate       : String(1000); // Attachments;
            WageAgreementCertificateNumber       : String(255);
            WageAgreementCertificateExpiryDate   : DateTime;
            LabourUnionsPresent                  : Boolean;
            NumberOfLabourUnions                 : String(255);
            InternalOrExternalUnions             : String(255);
            NatureOfUnions                       : String(255);
            PoliticalPartyAssociation            : String(255);
            NovationDeedRequired                 : Boolean;
            UploadNovationDeed                   : String(1000); // Attachments;
            CustomerRecommendation               : String(1000); // Attachments;
            // Payment Terms and Bank Information section
            PaymentTermsSims                     : String(255);
            PaymentTermsSsu                      : String(255);
            PaymentTermsCisMde                   : String(255);
            PaymentTermsAmIl                     : String(255);
            PaymentTermsSd                       : String(255);
            PaymentTermsFd                       : String(255);
            IncotermsLocationMandatory           : String(255);
            IncotermsLocationOptional            : String(255);
            // Bank Information
            BankAccountNumber                    : String(255);
            BankKeyIfscCode                      : String(255);
            ReConfirmBankAccountNumber           : String(255);
            BankAccountType                      : String(255);
            BankAccountName                      : String(255);
            BankCountry                          : String(255);
            BankName                             : String(255);
            IbanSwiftCode                        : String(255);
            BranchName                           : String(255);
            BankStreetAddress                    : String(255);
            CityVillage                          : String(255);
            State                                : String(255);
            PostalCode                           : String(255);
            RegionCodeForeignAccount             : String(255);
            BankDocumentsRequired                : String(255);
            NameMismatchDeclarationAttachment    : String(1000); // Attachments;
            InternetHomepage                     : String(255);
            // Attach Documents section
            CompanyRegistrationCertificate       : String(1000); // Attachments;
            AuditedFinancialRecords              : String(1000); // Attachments;
            ExportLicense                        : String(1000); // Attachments;
            CompanyPresentation                  : String(1000); // Attachments;
            MemorandumOfAssociation              : String(1000); // Attachments;
            ArticleOfAssociation                 : String(1000); // Attachments;
            NewFactoryPhotos                     : String(1000); // Attachments;
            OrganisationChart                    : String(1000); // Attachments;
            ToolCellSupplierPanelMail            : String(1000); // Attachments;
            VendorProfileFormat                  : String(1000); // Attachments;
            PriceSettlementDetails               : String(1000); // Attachments;
            InternationalSanctionDocument        : String(1000); // Attachments;
            ItrForm                              : String(1000); // Attachments;
            // Functional Representative of Supplier
            FunctionalRepresentativeFirstName    : String(255);
            FunctionalRepresentativeLastName     : String(255);
            FunctionalRepresentativeContact      : String(255);
            FunctionalRepresentativeEmail        : String(255);
            // CEO Details
            CeoFirstName                         : String(255);
            CeoLastName                          : String(255);
            CeoContactDetail                     : String(255);
            CeoEmailAddress                      : String(255);
            // Development (CDMM)
            DevelopmentFirstName                 : String(255);
            DevelopmentLastName                  : String(255);
            DevelopmentContactDetail             : String(255);
            DevelopmentEmailAddress              : String(255);
            // Key Account Manager
            KeyAccountManagerFirstName           : String(255);
            KeyAccountManagerLastName            : String(255);
            KeyAccountManagerContactDetail       : String(255);
            KeyAccountManagerEmailAddress        : String(255);
            // Supply Chain Management POC
            ScmFirstName                         : String(255);
            ScmLastName                          : String(255);
            ScmContactDetail                     : String(255);
            ScmEmailAddress                      : String(255);
            // Quality POC
            QualityFirstName                     : String(255);
            QualityLastName                      : String(255);
            QualityContactDetail                 : String(255);
            QualityEmailAddress                  : String(255);
            // Key Account Manager (SPARES) POC
            KeyAccountManagerSparesFirstName     : String(255);
            KeyAccountManagerSparesLastName      : String(255);
            KeyAccountManagerSparesContactDetail : String(255);
            KeyAccountManagerSparesEmailAddress  : String(255);
            // GST POC
            GstFirstName                         : String(255);
            GstLastName                          : String(255);
            GstContactDetail                     : String(255);
            GstEmailAddress                      : String(255);
            // Accounts POC
            AccountsFirstName                    : String(255);
            AccountsLastName                     : String(255);
            AccountsContactDetail                : String(255);
            AccountsEmailAddress                 : String(255);
            // EHS / Safety POC
            EhsFirstName                         : String(255);
            EhsLastName                          : String(255);
            EhsContactDetail                     : String(255);
            EhsEmailAddress                      : String(255);
            // Marketing / Sales POC
            MarketingFirstName                   : String(255);
            MarketingLastName                    : String(255);
            MarketingContactDetail               : String(255);
            MarketingEmailAddress                : String(255);
            // SBCB POC
            SbcbFirstName                        : String(255);
            SbcbLastName                         : String(255);
            SbcbContactDetail                    : String(255);
            SbcbEmailAddress                     : String(255);
            // ESG POC
            EsgFirstName                         : String(255);
            EsgLastName                          : String(255);
            EsgContactDetail                     : String(255);
            EsgEmailAddress                      : String(255);
            // Plant Head POC
            PlantHeadFirstName                   : String(255);
            PlantHeadLastName                    : String(255);
            PlantHeadContactDetail               : String(255);
            PlantHeadEmailAddress                : String(255);
            // Cybersecurity / IT Head POC
            ItHeadFirstName                      : String(255);
            ItHeadLastName                       : String(255);
            ItHeadContactDetail                  : String(255);
            ItHeadEmailAddress                   : String(255);
            // Local Representative POC
            LocalRepFirstName                    : String(255);
            LocalRepLastName                     : String(255);
            LocalRepContactDetail                : String(255);
            LocalRepEmailAddress                 : String(255);


    };

    entity sreq_attachments : cuid, managed {

        @Core.ContentDisposition.Filename: fileName
        @Core.MediaType                  : mediaType

        content       : LargeBinary; // Attachments;
        fileName      : String;
        Doc_Type      : common.attachmentT;
        Attachment_ID : Int16;

        @Core.IsMediaType                : true

        mediaType     : String;

        Req_Supplier  : Association to supplier_request;


    };

    entity SeqTracker {
        key TrackerID : Association to supplier_request;
            LastSeq   : Integer;


    }


}

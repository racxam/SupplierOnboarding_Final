using {supplierOnboardingdb as db} from '../db/schema';
using {common.db as common} from '../db/master';


service OnboardingService @(path: '/OnboardingService') {


    //transctions
    entity SReqattachmentsSrv      as projection on db.transcation.sreq_attachments;
    entity SupplierReqSrv          as projection on db.transcation.supplier_request;
    entity SeqTrackerSrv           as projection on db.transcation.SeqTracker;

    
    // Master data entities
    entity departmentsFunctionsSrv as projection on common.master.departmentFunctions;
    entity SupplierSpendTypeSrv    as projection on common.master.SupplierSpendType;
    entity NatureOfActivitySrv     as projection on common.master.NatureOfActivity;
    entity SectorSrv               as projection on common.master.Sector;
    entity SchemaGroupSrv          as projection on common.master.SchemaGroup;
    entity PurchasOrderCurrCodeSrv as projection on common.master.PurchasOrderCurrCode;
    entity DepartmentsSrv          as projection on common.master.Departments;
    entity CodeCreationTypeSrv     as projection on common.master.CodeCreationType;
    entity ROVCreationSrv          as projection on common.master.ROVCreation;
    entity SupplierTypeSrv         as projection on common.master.SupplierType;
    entity StatusSrv               as projection on common.master.Status;
    entity GSTINTypeSrv            as projection on common.master.GSTINType;
    entity SupplierOrgTypeSrv      as projection on common.master.SupplierOrgType;
    entity TurnoverSlabSrv         as projection on common.master.TurnoverSlab;
    entity IndustryTypeSrv         as projection on common.master.IndustryType;
    entity MSMETypeSrv             as projection on common.master.MSMEType;
    entity CountryCodeSrv          as projection on common.master.CountryCode;
    entity NatureOfUnionSrv        as projection on common.master.NatureOfUnion;
    entity PaymentTermsSrv         as projection on common.master.PaymentTerms;
    entity IncotermsSrv            as projection on common.master.Incoterms;
    entity BankCountrySrv          as projection on common.master.BankCountry;
    entity BankAccountTypeSrv      as projection on common.master.BankAccountType;
    entity StateSrv                as projection on common.master.State;
    entity OrgTypeSrv              as projection on common.master.OrgType;
    entity AMVendorTypeSrv         as projection on common.master.AMVendorType;

    //actions and functions
    function DoValidation() returns Boolean;

    action   ValidatePAN(pan : String) returns String;
    action   ValidateGST(gst : String) returns String;


};
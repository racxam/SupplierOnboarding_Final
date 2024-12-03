namespace common.db;

using {cuid} from '@sap/cds/common';

// Texts
type TextLimited               : String(255);
type Text                      : String(4000);
type TextMultiple              : String;
//Decimal should be upto two places

// Fri., 12 Aug.,2009.  Date format

//master tables start

context master {
    //supplier req departmetns
    entity departmentFunctions {
        key DepartmentName : String(5);
            Functions      : array of String;

    };

    entity SchemaGroup : cuid {
        SupplierType : String;
        Group        : String;
    }

    entity PurchasOrderCurrCode : cuid {
        Codes : String;

    }

    entity Departments : cuid {
        Name : String;
    }

    entity SupplierSpendType : cuid {
        SpendsTypes : String;

    };

    entity CodeCreationType : cuid {
        RequestTypes : String;

    };

    entity ROVCreation : cuid {
        Reason : String;

    }

    entity NatureOfActivity : cuid {
        Activity : String;

    };

    entity SupplierType : cuid {
        Types : String;

    }

    entity Sector : cuid {
        Sectors : String;

    };

    entity Status : cuid {
        Stage  : String;
        Status : array of String;

    };


    //Master data tables for the Supplier Registration form
    entity GSTINType : cuid {
        Type : String(50);
    };

    entity SupplierOrgType : cuid {
        Type : String(50);
    };

    entity TurnoverSlab : cuid {
        Slab : String(50);
    };

    entity IndustryType : cuid {
        IndustryType : String(50);
    };

    entity MSMEType : cuid {
        Type : String(50);
    };

    entity CountryCode : cuid {
        Code : String(10);
    };

    entity NatureOfUnion : cuid {
        UnionType : String(50);
    };

    entity PaymentTerms : cuid {
        DepartmentName : String;
        PaymentTerms   : array of String;
    };

    entity Incoterms : cuid {

        IncotermsCode : String(10);
        Description   : String(255);
    };

    entity BankCountry : cuid {

        CountryCode : String;
        CountryName : String;
    };

    entity BankAccountType : cuid {

        AccountType : String;
    };

    entity State : cuid {

        StateName : String;
    };

    entity OrgType : cuid {
        Type : String; // Name of the organization type
    };

    entity AMVendorType : cuid {

        Name : String; // Type of the vendor (e.g., Trader, Authorised Dealer, etc.)
    };

    entity FunctionalRepresentatives : cuid {
        Designation   : String(50);
        FirstName     : String(50);
        LastName      : String(50);
        Email         : String(100);
        ContactNumber : String(15);
    }


}
//master tables end


type attachmentT               : String enum {
    PAN_CARD                                       = 'PAN';
    GSTIN                                          = 'GST';

};

//Vendor Code Creation Request Type
type VCodeCreateReqT           : TextLimited enum {
    NewSupplier                                    = 'New Supplier';
    DigressionVendor                               = 'Digression Vendor';
    WarehouseVendorCode                            = 'Warehouse Vendor code';
    AdditionalVendorCode                           = 'Additional Vendor Code';
    AdditionalProcurementType                      = 'Additional Procurement Type';
    ReplacementOfObsoleteVendor                    = 'Replacement of Obsolete Vendor (ROV)';
};

type DepartmentT               : String(15) enum {
    AM                                             = 'AM';
    Digitisation                                   = 'Digitisation';
    IL                                             = 'IL';
    MIS                                            = 'MIS';
    PCM                                            = 'PCM';
    SBU                                            = 'SBU';
    SIMS                                           = 'SIMS';
    SSU                                            = 'SSU';
}

type ROVCreationReasonT        : TextMultiple enum {
    NameChange                                     = 'Name Change';
    AddressChange                                  = 'Address Change';
    OtherDetails                                   = 'Other details';
}


type StatusT                   : String enum {
    DRAFT;
    PENDING;
    ACCPECTED;
    REJECTED;
    ONBOARDED;

};

type PurchasOrderCurrCodeT     : String enum {
    ADP                                            = 'ADP-Andoran peseta';
    AED                                            = 'AED-United Arab Emirates Dirham';
    AFA                                            = 'AFA-Afghani (Old)';
    AFN                                            = 'AFN-Afghani';
    ALLK                                           = 'ALL-Albanian Lek'; // need to see
    AMD                                            = 'AMD-Armenian Dram';
    ANG                                            = 'ANG-West Indian Guilder';
    AOA                                            = 'AOA-Angolanische Kwanza';
    AON                                            = 'AON-Angolan New Kwanza (Old)';
    AOR                                            = 'AOR-Angolan Kwanza Reajustado (Old)';
    ARS                                            = 'ARS-Argentine Peso';
    ATS                                            = 'ATS-Austrian Schilling';
    AUD                                            = 'AUD-Australian Dollar';
    AWG                                            = 'AWG-Aruban Guilder';
    AZM                                            = 'AZM-Azerbaijan Manat';
    BAM                                            = 'BAM-Bosnia and Herzegovina Convertible Mark';
    BBD                                            = 'BBD-Barbados Dollar';
    BDT                                            = 'BDT-Bangladesh Taka';
    BEF                                            = 'BEF-Belgian Franc';
    BGN                                            = 'BGN-Bulgarian Lev';
    BHD                                            = 'BHD-Bahrain Dinar';
    BIF                                            = 'BIF-Burundi Franc';
    BMD                                            = 'BMD-Bermudan Dollar';
    BND                                            = 'BND-Brunei Dollar';
    BOB                                            = 'BOB-Boliviano';
    BRL                                            = 'BRL-Brazilian Real';
    BSD                                            = 'BSD-Bahaman Dollar';
    BTN                                            = 'BTN-Bhutan Ngultrum';
    BWP                                            = 'BWP-Botswana Pula';
    BYB                                            = 'BYB-Belorussian Ruble (Old)';
    BYR                                            = 'BYR-Belorussian Ruble';
    BZD                                            = 'BZD-Belize Dollar';
    CAD                                            = 'CAD-Canadian Dollar';
    CDF                                            = 'CDF-Congolese Franc';
    CFP                                            = 'CFP-French Franc (Pacific Islands)';
    CHF                                            = 'CHF-Swiss Franc';
    CLP                                            = 'CLP-Chilean Peso';
    CNY                                            = 'CNY-Chinesische Yuan (international)';
    COP                                            = 'COP-Colombian Peso';
    CRC                                            = 'CRC-Costa Rica Colon';
    CSD                                            = 'CSD-Serbian Dinar';
    CUP                                            = 'CUP-Cuban Peso';
    CVE                                            = 'CVE-Cape Verde Escudo';
    CYP                                            = 'CYP-Cyprus Pound';
    CZK                                            = 'CZK-Czech Krona';
    DEM                                            = 'DEM-German Mark';
    DJF                                            = 'DJF-Djibouti Franc';
    DKK                                            = 'DKK-Danish Krone';
    DOP                                            = 'DOP-Dominican Peso';
    DZD                                            = 'DZD-Algerian Dinar';
    ECS                                            = 'ECS-Ecuadorian Sucre (  > USD)';
    EEK                                            = 'EEK-Estonian Krone';
    EGP                                            = 'EGP-Egyptian Pound';
    ERN                                            = 'ERN-Eritrean Nafka';
    ESP                                            = 'ESP-Spanish Peseta';
    ETB                                            = 'ETB-Ethiopian Birr';
    EUR                                            = 'EUR-European Euro';
    FIM                                            = 'FIM-Finnish markka';
    FJD                                            = 'FJD-Fiji Dollar';
    FKP                                            = 'FKP-Falkland Pound';
    FRF                                            = 'FRF-French Franc';
    GBP                                            = 'GBP-British Pound';
    GEL                                            = 'GEL-Georgian Lari';
    GHC                                            = 'GHC-Ghanian Cedi';
    GIP                                            = 'GIP-Gibraltar Pound';
    GMD                                            = 'GMD-Gambian Dalasi';
    GNF                                            = 'GNF-Guinean Franc';
    GRD                                            = 'GRD-Greek Drachma';
    GTQ                                            = 'GTQ-Guatemalan Quetzal';
    GWP                                            = 'GWP-Guinea Peso';
    GYD                                            = 'GYD-Guyana Dollar';
    HKD                                            = 'HKD-Hong Kong Dollar';
    HNL                                            = 'HNL-Honduran Lempira';
    HRK                                            = 'HRK-Croatian Kuna';
    HTG                                            = 'HTG-Haitian Gourde';
    HUF                                            = 'HUF-Hungarian Forint';
    IDR                                            = 'IDR-Indonesian Rupiah';
    IEP                                            = 'IEP-Irish Punt';
    ILS                                            = 'ILS-Israeli Scheckel';
    INR                                            = 'INR-Indian Rupee';
    IQD                                            = 'IQD-Iraqui Dinar';
    IRR                                            = 'IRR-Iranian Rial';
    ISK                                            = 'ISK-Iceland Krona';
    ITL                                            = 'ITL-Italian Lira';
    JMD                                            = 'JMD-Jamaican Dollar';
    JOD                                            = 'JOD-Jordanian Dinar';
    JPY                                            = 'JPY-Japanese Yen';
    KES                                            = 'KES-Kenyan Shilling';
    KGS                                            = 'KGS-Kyrgyzstan Som';
    KHR                                            = 'KHR-Cambodian Riel';
    KMF                                            = 'KMF-Comoros Franc';
    KPW                                            = 'KPW-North Korean Won';
    KRW                                            = 'KRW-South Korean Won';
    KWD                                            = 'KWD-Kuwaiti Dinar';
    KYD                                            = 'KYD-Cayman Dollar';
    KZT                                            = 'KZT-Kazakstanian Tenge';
    LAK                                            = 'LAK-Laotian Kip';
    LBP                                            = 'LBP-Lebanese Pound';
    LKR                                            = 'LKR-Sri Lankan Rupee';
    LRD                                            = 'LRD-Liberian Dollar';
    LSL                                            = 'LSL-Lesotho Loti';
    LTL                                            = 'LTL-Lithuanian Lita';
    LUF                                            = 'LUF-Luxembourg Franc';
    LVL                                            = 'LVL-Latvian Lat';
    LYD                                            = 'LYD-Libyan Dinar';
    MAD                                            = 'MAD-Moroccan Dirham';
    MDL                                            = 'MDL-Moldavian Leu';
    MGA                                            = 'MGA-Madagascan Ariary (New)';
    MGF                                            = 'MGF-Madagascan Franc (Old)';
    MKD                                            = 'MKD-Macedonian Denar';
    MMK                                            = 'MMK-Myanmar Kyat';
    MNT                                            = 'MNT-Mongolian Tugrik';
    MOP                                            = 'MOP-Macao Pataca';
    MPES                                           = 'MPES-mexican Peso';
    MRO                                            = 'MRO-Mauritanian Ouguiya';
    MTL                                            = 'MTL-Maltese Lira';
    MUR                                            = 'MUR-Mauritian Rupee';
    MVR                                            = 'MVR-Maldive Rufiyaa';
    MWK                                            = 'MWK-Malawi Kwacha';
    MXN                                            = 'MXN-Mexican Pesos';
    MYR                                            = 'MYR-Malaysian Ringgit';
    MZM                                            = 'MZM-Mozambique Metical';
    NAD                                            = 'NAD-Namibian Dollar';
    NGN                                            = 'NGN-Nigerian Naira';
    NIO                                            = 'NIO-Nicaraguan Cordoba Oro';
    NLG                                            = 'NLG-Dutch Guilder';
    NOK                                            = 'NOK-Norwegian Krone';
    NPR                                            = 'NPR-Nepalese Rupee';
    NZD                                            = 'NZD-New Zealand Dollars';
    OMR                                            = 'OMR-Omani Rial';
    PAB                                            = 'PAB-Panamanian Balboa';
    PEN                                            = 'PEN-Peruvian New Sol';
    PGK                                            = 'PGK-Papua New Guinea Kina';
    PHP                                            = 'PHP-Philippine Peso';
    PKR                                            = 'PKR-Pakistani Rupee';
    PLN                                            = 'PLN-Polish Zloty (new)';
    PTE                                            = 'PTE-Portuguese Escudo';
    PYG                                            = 'PYG-Paraguayan Guarani';
    QAR                                            = 'QAR-Qatar Rial';
    RMB                                            = 'RMB-Chinesische Renminbi (national)';
    ROL                                            = 'ROL-Romanian Leu';
    RUB                                            = 'RUB-Russian Ruble';
    RWF                                            = 'RWF-Rwandan Franc';
    SAR                                            = 'SAR-Saudi Riyal';
    SBD                                            = 'SBD-Solomon Islands Dollar';
    SCR                                            = 'SCR-Seychelles Rupee';
    SDD                                            = 'SDD-Sudanese Dinar';
    SDP                                            = 'SDP-Sudanese Pound';
    SEK                                            = 'SEK-Swedish Krona';
    SGD                                            = 'SGD-Singapore Dollar';
    SHP                                            = 'SHP-St.Helena Pound';
    SIT                                            = 'SIT-Slovenian Tolar';
    SKK                                            = 'SKK-Slovakian Krona';
    SLL                                            = 'SLL-Sierra Leone Leone';
    SOS                                            = 'SOS-Somalian Shilling';
    SRD                                            = 'SRD-Surinam Dollar';
    SRG                                            = 'SRG-Surinam Guilder (Old)';
    STD                                            = 'STD-Sao Tome / Principe Dobra';
    SVC                                            = 'SVC-El Salvador Colon';
    SYP                                            = 'SYP-Syrian Pound';
    SZL                                            = 'SZL-Swaziland Lilangeni';
    THB                                            = 'THB-Thailand Baht';
    TJS                                            = 'TJS-Tajikistan Somoni';
    TMM                                            = 'TMM-Turkmenistan Manat';
    TND                                            = 'TND-Tunisian Dinar';
    TOP                                            = 'TOP-Tongan Paanga';
    TPE                                            = 'TPE-East Timor Escudo';
    TRL                                            = 'TRL-Turkish Lira (old)';
    TRY                                            = 'TRY-New Turkish Lira';
    TTD                                            = 'TTD-Trinidad Tobago Dollar';
    TWD                                            = 'TWD-Taiwan Dollar';
    TZS                                            = 'TZS-Tanzanian Shilling';
    UAH                                            = 'UAH-Ukraine Hryvna';
    UGX                                            = 'UGX-Ugandan Shilling';
    USD                                            = 'USD-US Dollar';
    UYU                                            = 'UYU-Uruguayan Peso';
    UZS                                            = 'UZS-Uzbekistan Sum';
    VEB                                            = 'VEB-Venezuelan Bolivar';
    VND                                            = 'VND-Vietnamese Dong';
    VUV                                            = 'VUV-Vanuatu Vatu';
    WST                                            = 'WST-Samoan Tala';
    XAF                                            = 'XAF-CFA Franc (Central Africa)';
    XAG                                            = 'XAG-Silver Ounces';
    XAU                                            = 'XAU-Gold Ounces';
    XCD                                            = 'XCD-East Caribbean Dollar';
    XDR                                            = 'XDR-IMF Special Drawing Rights';
    XOF                                            = 'XOF-CFA Franc (West Africa)';
    XPF                                            = 'XPF-Pacific Franc';
    YER                                            = 'YER-Yemeni Rial';
    YUD                                            = 'YUD-Yugoslav Dinar';
    ZAR                                            = 'ZAR-South African Rand';
    ZMK                                            = 'ZMK-Zambian Kwacha (old)';
    ZWD                                            = 'ZWD-Zimbabwe Dollar';
    ZWL                                            = 'ZWL-Zimbabwe Dollar';
}


type SupplierSpendT            : TextLimited enum {
    Indirect;
    Direct;
    Capital;
    ExclusiveTooling                               = 'Exclusive Tooling';
    ExclusiveValueFit                              = 'Exclusive Value Fit';
    ExclusiveProto                                 = 'Exclusive Proto';
    ExclusiveAccessories                           = 'Exclusive Accessories';
    ExclusiveNonPO                                 = 'Exclusive Non-PO';
};

type SupplierT                 : String(50) enum {
    LocalGST                                       = 'Local GST';
    LocalNonGST                                    = 'Local Non-GST';
    Import                                         = 'Import';
}

type AccGroupT                 : String(4) enum {
    LIEF                                           = 'LIEF'      @Description: 'Vendor (Ext. Number Assignment)';
                                                   SERV = 'SERV' @Description: 'Service Vendors';
                                                   IMP1 = 'IMP1' @Description: 'Import Vendors';
                                                   ASSU = 'ASSU' @Description: 'Asso / Subs / Plants';
}

type DiligenceCheckT           : String enum {
    Done                                           = 'Done';
    Not_Done                                       = 'Not Done';
}

type PurchOrgT                 : String enum {
    INPO                                           = 'M&M Purch Org India';
}

type funAndSubFunT             : TextLimited enum {
    SSU_ATProp                                     = 'SSU - A&T Prop';
    SSU_Casting                                    = 'SSU - Casting';
    SSU_Forging                                    = 'SSU - Forging';
    SSU_Engine                                     = 'SSU - Engine';
    SSU_RMSteelTyresPaintsChemicals                = 'SSU - RM, Steel, Tyres, Paints & Chemicals';
    SSU_VehicleProp                                = 'SSU - Vehicle Prop';
    SSU_FES                                        = 'SSU - FES';
    SSU_CVProp                                     = 'SSU - CV Prop.';
    SSU_EE1                                        = 'SSU - EE1';
    SSU_EE2                                        = 'SSU - EE2';
    SSU_Ept                                        = 'SSU - Ept';
    SSU_BIW                                        = 'SSU - BIW';
    SSU_Trims                                      = 'SSU - Trims';
    SSU_Swaraj                                     = 'SSU - Swaraj';
    AM                                             = 'AM';
    IL_Imports                                     = 'IL - Imports';
    IL_Exports                                     = 'IL - Exports';
    SIMS_IndirectMaterial                          = 'SIMS - Indirect Material';
    SIMS_IndirectServices                          = 'SIMS - Indirect Services';
    SIMS_LogisticsPackaging                        = 'SIMS - Logistics & Packaging';
    SIMS_SalesMarketing                            = 'SIMS - Sales & Marketing';
    SIMS_TravelHospitality                         = 'SIMS - Travel & Hospitality';
    PCM                                            = 'PCM';
    SBU_AD                                         = 'SBU - AD';
    SBU_FD                                         = 'SBU - FD';
    SBU_ValueFit                                   = 'SBU - Value Fit';
};


type NatureOfActivityT         : String enum {
    Material                                       = 'Material';
    Services                                       = 'Services';
};

type SectorT                   : String enum {
    AutomotiveDivision                             = 'AD'; // Automotive Division
    AutoFarmSector                                 = 'AFS'; // Auto & Farm Sector
    ConstructionEquipment                          = 'CE'; // Construction Equipment
    ClassicLegends                                 = 'CLPL'; // Classic Legends Pvt. Ltd.
    FarmDivision                                   = 'FD'; // Farm Division
    ElectricMobility                               = 'MEML'; // Mahindra Electric Mobility Limited
    HeavyEngines                                   = 'MHEPL'; // Mahindra Heavy Engines Pvt Ltd
    TruckBusDivision                               = 'MTBD'; // Mahindra Truck & Bus Division
    TwoWheeler                                     = 'MTWL'; // Mahindra Two Wheeler Ltd
    Powerol                                        = 'POWEROL'; // Mahindra Powerol
    SwarajDivision                                 = 'SD'; // Swaraj i dont know
    HeadOffice                                     = 'HO'; // Mahindra Head Office
    LastMileMobility                               = 'MLMML'; // Mahindra Last Mile Mobility Ltd
}

type GSTStatusT                : String(10) enum {
    Active;
    Inactive;

}

type PanCardT                  : String(10) @assert.format: '[A-Z]{5}[0-9]{4}[A-Z]{1}';
type GstInT                    : String(15) @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';


//supplier on boarding
type GSTINTypeT                : String enum {
    Registered;
    CompositionScheme;
    SpecialEconomicZone;
    SEZDeveloper;
    SEZUnit;
    PSUGovernmentRegistration                      = 'PSU or GovernmentRegistration';
}

type GSTRFilerT                : String enum {
    Monthly;
    Quarterly;
}

type SupplierOrganizationTypeT : String enum {
    Individual                                     = 'Individual';
    Company                                        = 'Company';
    PartnershipFirms                               = 'Partnership Firms';
    HUF                                            = 'HUF';
    Trust                                          = 'Trust';
    LLP                                            = 'LLP';
    LocalAuthority                                 = 'Local Authority';
    Government                                     = 'Government';
    BodyOfIndividuals                              = 'Body of individuals';
}

type CINNumberT                : String(12) @assert.format: '^[a-zA-Z0-9]{12}$';
type DUNSNumberT               : String(9) @assert.format: '^[a-zA-Z0-9]{9}$';

type IndustryTypeT             : String enum {
    Manufacturing;
    Service;
}

type MSMETypeT                 : String enum {
    Medium;
    Micro;
    Small;
}

type CurrencyCodeT             : TextLimited enum {
    ADP                                            = 'Andoran peseta';
    AED                                            = 'United Arab Emirates Dirham';
    AFA                                            = 'Afghani (Old)';
    AFN                                            = 'Afghani';
    ALBL                                           = 'Albanian Lek';
    AMD                                            = 'Armenian Dram';
    ANG                                            = 'West Indian Guilder';
    AOA                                            = 'Angolanische Kwanza';
    AON                                            = 'Angolan New Kwanza (Old)';
    AOR                                            = 'Angolan Kwanza Reajustado (Old)';
    ARS                                            = 'Argentine Peso';
    ATS                                            = 'Austrian Schilling';
    AUD                                            = 'Australian Dollar';
    AWG                                            = 'Aruban Guilder';
    AZM                                            = 'Azerbaijan Manat';
    BAM                                            = 'Bosnia and Herzegovina Convertible Mark';
    BBD                                            = 'Barbados Dollar';
    BDT                                            = 'Bangladesh Taka';
    BEF                                            = 'Belgian Franc';
    BGN                                            = 'Bulgarian Lev';
    BHD                                            = 'Bahrain Dinar';
    BIF                                            = 'Burundi Franc';
    BMD                                            = 'Bermudan Dollar';
    BND                                            = 'Brunei Dollar';
    BOB                                            = 'Boliviano';
    BRL                                            = 'Brazilian Real';
    BSD                                            = 'Bahaman Dollar';
    BTN                                            = 'Bhutan Ngultrum';
    BWP                                            = 'Botswana Pula';
    BYB                                            = 'Belorussian Ruble (Old)';
    BYR                                            = 'Belorussian Ruble';
    BZD                                            = 'Belize Dollar';
    CAD                                            = 'Canadian Dollar';
    CDF                                            = 'Congolese Franc';
    CFP                                            = 'French Franc (Pacific Islands)';
    CHF                                            = 'Swiss Franc';
    CLP                                            = 'Chilean Peso';
    CNY                                            = 'Chinesische Yuan (international)';
    COP                                            = 'Colombian Peso';
    CRC                                            = 'Costa Rica Colon';
    CSD                                            = 'Serbian Dinar';
    CUP                                            = 'Cuban Peso';
    CVE                                            = 'Cape Verde Escudo';
    CYP                                            = 'Cyprus Pound';
    CZK                                            = 'Czech Krona';
    DEM                                            = 'German Mark';
    DEM3                                           = '(Internal) German Mark (3 dec.places)';
    DJF                                            = 'Djibouti Franc';
    DKK                                            = 'Danish Krone';
    DOP                                            = 'Dominican Peso';
    DZD                                            = 'Algerian Dinar';
    ECS                                            = 'Ecuadorian Sucre ( > USD)';
    EEK                                            = 'Estonian Krone';
    EGP                                            = 'Egyptian Pound';
    ERN                                            = 'Eritrean Nafka';
    ESP                                            = 'Spanish Peseta';
    ETB                                            = 'Ethiopian Birr';
    EUR                                            = 'European Euro';
    EUR4                                           = 'European Euro';
    FIM                                            = 'Finnish markka';
    FJD                                            = 'Fiji Dollar';
    FKP                                            = 'Falkland Pound';
    FRF                                            = 'French Franc';
    GBP                                            = 'British Pound';
    GEL                                            = 'Georgian Lari';
    GHC                                            = 'Ghanian Cedi';
    GIP                                            = 'Gibraltar Pound';
    GMD                                            = 'Gambian Dalasi';
    GNF                                            = 'Guinean Franc';
    GRD                                            = 'Greek Drachma';
    GTQ                                            = 'Guatemalan Quetzal';
    GWP                                            = 'Guinea Peso';
    GYD                                            = 'Guyana Dollar';
    HKD                                            = 'Hong Kong Dollar';
    HNL                                            = 'Honduran Lempira';
    HRK                                            = 'Croatian Kuna';
    HTG                                            = 'Haitian Gourde';
    HUF                                            = 'Hungarian Forint';
    IDR                                            = 'Indonesian Rupiah';
    IEP                                            = 'Irish Punt';
    ILS                                            = 'Israeli Scheckel';
    INR                                            = 'Indian Rupee';
    IQD                                            = 'Iraqui Dinar';
    IRR                                            = 'Iranian Rial';
    ISK                                            = 'Iceland Krona';
    ITL                                            = 'Italian Lira';
    JMD                                            = 'Jamaican Dollar';
    JOD                                            = 'Jordanian Dinar';
    JPY                                            = 'Japanese Yen';
    KES                                            = 'Kenyan Shilling';
    KGS                                            = 'Kyrgyzstan Som';
    KHR                                            = 'Cambodian Riel';
    KMF                                            = 'Comoros Franc';
    KPW                                            = 'North Korean Won';
    KRW                                            = 'South Korean Won';
    KWD                                            = 'Kuwaiti Dinar';
    KYD                                            = 'Cayman Dollar';
    KZT                                            = 'Kazakstanian Tenge';
    LAK                                            = 'Laotian Kip';
    LBP                                            = 'Lebanese Pound';
    LKR                                            = 'Sri Lankan Rupee';
    LRD                                            = 'Liberian Dollar';
    LSL                                            = 'Lesotho Loti';
    LTL                                            = 'Lithuanian Lita';
    LUF                                            = 'Luxembourg Franc';
    LVL                                            = 'Latvian Lat';
    LYD                                            = 'Libyan Dinar';
    MAD                                            = 'Moroccan Dirham';
    MDL                                            = 'Moldavian Leu';
    MGA                                            = 'Madagascan Ariary (New)';
    MGF                                            = 'Madagascan Franc (Old)';
    MKD                                            = 'Macedonian Denar';
    MMK                                            = 'Myanmar Kyat';
    MNT                                            = 'Mongolian Tugrik';
    MOP                                            = 'Macao Pataca';
    MPES                                           = 'Mexican Peso';
    MRO                                            = 'Mauritanian Ouguiya';
    MTL                                            = 'Maltese Lira';
    MUR                                            = 'Mauritian Rupee';
    MVR                                            = 'Maldive Rufiyaa';
    MWK                                            = 'Malawi Kwacha';
    MXN                                            = 'Mexican Pesos';
    MYR                                            = 'Malaysian Ringgit';
    MZM                                            = 'Mozambique Metical';
    NAD                                            = 'Namibian Dollar';
    NGN                                            = 'Nigerian Naira';
    NIO                                            = 'Nicaraguan Cordoba Oro';
    NLG                                            = 'Dutch Guilder';
    NOK                                            = 'Norwegian Krone';
    NPR                                            = 'Nepalese Rupee';
    NZD                                            = 'New Zealand Dollars';
    NZD5                                           = 'New Zealand Dollars';
    OMR                                            = 'Omani Rial';
    PAB                                            = 'Panamanian Balboa';
    PEN                                            = 'Peruvian New Sol';
    PGK                                            = 'Papua New Guinea Kina';
    PHP                                            = 'Philippine Peso';
    PKR                                            = 'Pakistani Rupee';
    PLN                                            = 'Polish Zloty (new)';
    PTE                                            = 'Portuguese Escudo';
    PYG                                            = 'Paraguayan Guarani';
    QAR                                            = 'Qatar Rial';
    RMB                                            = 'Chinesische Renminbi (national)';
    ROL                                            = 'Romanian Leu';
    RUB                                            = 'Russian Ruble';
    RWF                                            = 'Rwandan Franc';
    SAR                                            = 'Saudi Riyal';
    SBD                                            = 'Solomon Islands Dollar';
    SCR                                            = 'Seychelles Rupee';
    SDD                                            = 'Sudanese Dinar';
    SDP                                            = 'Sudanese Pound';
    SEK                                            = 'Swedish Krona';
    SGD                                            = 'Singapore Dollar';
    SHP                                            = 'St. Helena Pound';
    SIT                                            = 'Slovenian Tolar';
    SKK                                            = 'Slovakian Krona';
    SLL                                            = 'Sierra Leone Leone';
    SOS                                            = 'Somalian Shilling';
    SRD                                            = 'Surinam Dollar';
    SRG                                            = 'Surinam Guilder (Old)';
    STD                                            = 'Sao Tome / Principe Dobra';
    SVC                                            = 'El Salvador Colon';
    SYP                                            = 'Syrian Pound';
    SZL                                            = 'Swaziland Lilangeni';
    THB                                            = 'Thailand Baht';
    TJR                                            = 'Tajikistani Ruble (Old)';
    TJS                                            = 'Tajikistani Somoni';
    TMM                                            = 'Turkmenistani Manat';
    TND                                            = 'Tunisian Dinar';
    TOP                                            = `Tongan Pa\'anga `;
    TPE                                            = 'Timor Escudo';
    TRL                                            = 'Turkish Lira (Old)';
    TRY                                            = 'Turkish Lira';
    TTD                                            = 'Trinidad and Tobago Dollar';
    TWD                                            = 'New Taiwan Dollar';
    TZS                                            = 'Tanzanian Shilling';
    UAH                                            = 'Ukraine Hryvnia';
    UGX                                            = 'Ugandan Shilling';
    USD                                            = 'United States Dollar';
    USDN                                           = '(Internal) United States Dollar (5 Dec.)';
    UYU                                            = 'Uruguayan Peso (new)';
    UZS                                            = 'Uzbekistan Som';
    VEB                                            = 'Venezuelan Bolivar';
    VEF                                            = 'Venezuelan Bolivar Hard';
    VND                                            = 'Vietnamese Dong';
    VUV                                            = 'Vanuatu Vatu';
    WST                                            = 'Samoan Tala';
    XAF                                            = 'Gabon CFA Franc BEAC';
    XCD                                            = 'East Carribean Dollar';
    XDS                                            = 'St. Christopher Dollar';
    XEU                                            = 'European Currency Unit (E.C.U.)';
    XOF                                            = 'Benin CFA Franc BCEAO';
    XPF                                            = 'CFP Franc';
    YER                                            = 'Yemeni Ryal';
    YUM                                            = 'New Yugoslavian Dinar (Old)';
    ZAR                                            = 'South African Rand';
    ZMK                                            = 'Zambian Kwacha';
    ZMW                                            = 'Zambian Kwacha';
    ZWD                                            = 'Zimbabwean Dollar';
};

type DomesticSchemaT           : String enum {
    Domestic_Schema                                = '[D1] - Domestic Schema';
}

type ImportSchemaT             : String enum {
    Domestic_Schema                                = '[I1] - Import Schema';
}

type IncotermsCodeT            : String enum {
    ExWorksFreightToPay                            = 'Ex-Works Freight to pay';
    FreeOnRoadToTransporterGodownYearEndFreightPay = 'Free On Road to transporter godown year end Freight Pay';
    FreeDeliveryToStoresFreightPaid                = 'Free delivery to stores - Freight paid';
    AirShipment                                    = 'Air Shipment';
    CostAndFreight                                 = 'Cost and Freight';
    CostAndInsurance                               = 'Cost and Insurance';
    CostInsuranceAndFreight                        = 'Cost, Insurance and Freight';
    CarriagePaidTo                                 = 'Carriage Paid To';
    DeliveredAtFrontier                            = 'Delivered At Frontier';
    DeliveredDutyPaid                              = 'Delivered Duty Paid';
    DoorDelivery                                   = 'Door Delivery';
    DeliveredDutyUnpaid                            = 'Delivered Duty Unpaid';
    ExWorks                                        = 'Ex Works';
    FreeAlongsideShip                              = 'Free Alongside Ship';
    FreeCarrier                                    = 'Free Carrier';
    FreeDelivery                                   = 'Free Delivery';
    FreeHouse                                      = 'Free House';
    FreeOnBoard                                    = 'Free On Board';
    FreeOnRoad                                     = 'Free On Road';
    GodownDelivery                                 = 'Godown Delivery';
    FreeOnBoardFreight                             = 'Free On Board - Freight';
    CostAndFreight2                                = 'Cost and Freight';
    CarriageAndInsurancePaid                       = 'Carriage and Insurance Paid';
    CostAndFreight3                                = 'Cost and Freight';
    DeliveredAtPlace                               = 'Delivered At Place';
    DeliveredAtTerminal                            = 'Delivered At Terminal';
    DeliveredExQuayDuty                            = 'Delivered Ex Quay (Duty';
    DeliveredExShip                                = 'Delivered Ex Ship';
    ExOurWorks                                     = 'Ex Our Works';
    ExYourWorks                                    = 'Ex Your Works';
    ExOurWorks2                                    = 'Ex Our Works';
};


type BankAccountTypeT          : String enum {
    Savings_Account;
    Current_Account;
}

type StateChoiceT              : String enum {
    Maharashtra                                    = 'Maharashtra';
    TamilNadu                                      = 'Tamil Nadu';
    MadhyaPradesh                                  = 'Madhya Pradesh';
    AndhraPradesh                                  = 'Andhra Pradesh';
    WestBengal                                     = 'West Bengal';
    UttarPradesh                                   = 'Uttar Pradesh';
    ArunachalPradesh                               = 'Arunachal Pradesh';
    Assam                                          = 'Assam';
    Bihar                                          = 'Bihar';
    Goa                                            = 'Goa';
    Gujarat                                        = 'Gujarat';
    Haryana                                        = 'Haryana';
    HimachalPradesh                                = 'Himachal Pradesh';
    JammuAndKashmir                                = 'Jammu & Kashmir';
    Karnataka                                      = 'Karnataka';
    Kerala                                         = 'Kerala';
    Manipur                                        = 'Manipur';
    Meghalaya                                      = 'Meghalaya';
    Mizoram                                        = 'Mizoram';
    Nagaland                                       = 'Nagaland';
    Orissa                                         = 'Orissa';
    Punjab                                         = 'Punjab';
    Rajasthan                                      = 'Rajasthan';
    Sikkim                                         = 'Sikkim';
    Tripura                                        = 'Tripura';
    AndamanAndNicobar                              = 'Andaman & Nicobar';
    Chandigarh                                     = 'Chandigarh';
    DadraAndNagarHaveli                            = 'Dadra and Nagar Haveli';
    DamanAndDiu                                    = 'Daman & Diu';
    Delhi                                          = 'Delhi';
    Lakshadweep                                    = 'Lakshadweep';
    Pondicherry                                    = 'Pondicherry';
    Chhattisgarh                                   = 'Chhattisgarh';
    Jharkhand                                      = 'Jharkhand';
    Telangana                                      = 'Telangana';
    Uttaranchal                                    = 'Uttaranchal';
    Ladakh                                         = 'Ladakh';

}

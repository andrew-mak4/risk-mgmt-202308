namespace riskmanagement;

using {managed} from '@sap/cds/common';

entity Risks : managed {
    key ID          : UUID @(Core.Computed: true);
        title       : String(100);
        owner       : String;
        prio        : String(5);
        descr       : String;
        miti        : Association to Mitigations;
        impact      : Integer;
        bp          : Association to BusinessPartners;
        cr          : Association to CustomerReturns;
        criticality : Integer;
}

entity Mitigations : managed {
    key ID       : UUID @(Core.Computed: true);
        descr    : String;
        owner    : String;
        timeline : String;
        risks    : Association to many Risks
                       on risks.miti = $self;
}

using {API_CUSTOMER_RETURN_SRV as cr} from '../srv/external/API_CUSTOMER_RETURN_SRV.csn';

entity CustomerReturns  as projection on cr.A_CustomerReturn {
    key CustomerReturn,
        CustomerReturnType,
        TransactionCurrency,
        TotalNetAmount
}


using {API_BUSINESS_PARTNER as bp} from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartners as projection on bp.A_BusinessPartner {
    key BusinessPartner,
        LastName,
        FirstName
}

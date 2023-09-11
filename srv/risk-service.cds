using {riskmanagement as rm} from '../db/schema';

/**
 * For serving end users
 */
service RiskService @(path: 'service/risk') {
    @odata.draft.enabled
    entity Risks            as projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations      as projection on rm.Mitigations;

    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;
}
using {riskmanagement as rm} from '../db/schema';

/**
 * For serving end users
 */
service RiskService @(path: 'service/risk') {
    @odata.draft.enabled
    entity Risks @(restrict: [
        {
            grant: ['READ'],
            to   : ['RiskViewer']
        },
        {
            grant: ['*'],
            to   : ['RiskManager']
        }
    ])                      as projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations @(restrict: [
        {
            grant: ['READ'],
            to   : ['RiskViewer']
        },
        {
            grant: ['*'],
            to   : ['RiskManager']
        }
    ])                      as projection on rm.Mitigations;

    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;

    @readonly
    entity CustomerReturns as projection on rm.CustomerReturns;
}
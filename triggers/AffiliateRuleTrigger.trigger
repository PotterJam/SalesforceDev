trigger AffiliateRuleTrigger on Affiliate_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateRuleHandler.handleAfterDelete(Trigger.old);
    }
}

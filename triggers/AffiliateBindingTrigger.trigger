trigger AffiliateBindingTrigger on Affiliate_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBindingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger AffiliateModelTrigger on Affiliate_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateModelHandler.handleAfterDelete(Trigger.old);
    }
}

trigger AffiliateConfigTrigger on Affiliate_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateConfigHandler.handleAfterDelete(Trigger.old);
    }
}

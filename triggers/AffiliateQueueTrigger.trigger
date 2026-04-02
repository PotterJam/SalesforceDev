trigger AffiliateQueueTrigger on Affiliate_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateQueueHandler.handleAfterDelete(Trigger.old);
    }
}

trigger QuotaFeedTrigger on Quota_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaFeedHandler.handleAfterDelete(Trigger.old);
    }
}

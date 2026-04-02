trigger QuotaHookTrigger on Quota_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHookHandler.handleAfterDelete(Trigger.old);
    }
}

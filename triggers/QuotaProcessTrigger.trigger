trigger QuotaProcessTrigger on Quota_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProcessHandler.handleAfterDelete(Trigger.old);
    }
}

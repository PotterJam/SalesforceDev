trigger QuotaHandlerTrigger on Quota_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

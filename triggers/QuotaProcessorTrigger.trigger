trigger QuotaProcessorTrigger on Quota_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

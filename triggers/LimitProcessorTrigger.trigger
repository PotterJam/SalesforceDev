trigger LimitProcessorTrigger on Limit_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

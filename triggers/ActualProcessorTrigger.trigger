trigger ActualProcessorTrigger on Actual_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

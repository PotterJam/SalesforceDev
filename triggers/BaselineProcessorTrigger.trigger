trigger BaselineProcessorTrigger on Baseline_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

trigger VarianceProcessorTrigger on Variance_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

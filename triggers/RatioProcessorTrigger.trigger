trigger RatioProcessorTrigger on Ratio_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

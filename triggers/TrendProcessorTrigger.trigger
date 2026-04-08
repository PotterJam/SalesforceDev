trigger TrendProcessorTrigger on Trend_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

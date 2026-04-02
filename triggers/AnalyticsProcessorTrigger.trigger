trigger AnalyticsProcessorTrigger on Analytics_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

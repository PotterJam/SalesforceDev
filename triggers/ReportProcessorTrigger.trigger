trigger ReportProcessorTrigger on Report_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

trigger SeverityProcessorTrigger on Severity_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

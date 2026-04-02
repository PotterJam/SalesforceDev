trigger ComplianceProcessorTrigger on Compliance_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

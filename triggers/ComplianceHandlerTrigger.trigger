trigger ComplianceHandlerTrigger on Compliance_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

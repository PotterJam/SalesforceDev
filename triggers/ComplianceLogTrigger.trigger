trigger ComplianceLogTrigger on Compliance_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceLogHandler.handleAfterDelete(Trigger.old);
    }
}

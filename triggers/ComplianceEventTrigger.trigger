trigger ComplianceEventTrigger on Compliance_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEventHandler.handleAfterDelete(Trigger.old);
    }
}

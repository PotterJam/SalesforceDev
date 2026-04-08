trigger ComplianceEntryTrigger on Compliance_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEntryHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ComplianceHookTrigger on Compliance_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceHookHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ComplianceTriggerTrigger on Compliance_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

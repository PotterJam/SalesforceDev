trigger ComplianceRegistryTrigger on Compliance_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRegistryHandler.handleAfterDelete(Trigger.old);
    }
}

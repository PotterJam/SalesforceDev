trigger ComplianceStoreTrigger on Compliance_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStoreHandler.handleAfterDelete(Trigger.old);
    }
}

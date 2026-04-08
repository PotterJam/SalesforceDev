trigger ComplianceItemTrigger on Compliance_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceItemHandler.handleAfterDelete(Trigger.old);
    }
}

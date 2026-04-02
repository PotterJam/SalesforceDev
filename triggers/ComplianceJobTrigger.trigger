trigger ComplianceJobTrigger on Compliance_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceJobHandler.handleAfterDelete(Trigger.old);
    }
}

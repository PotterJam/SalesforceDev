trigger CompliancePolicyTrigger on Compliance_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CompliancePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CompliancePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CompliancePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CompliancePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CompliancePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CompliancePolicyHandler.handleAfterDelete(Trigger.old);
    }
}

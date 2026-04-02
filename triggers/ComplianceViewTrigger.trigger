trigger ComplianceViewTrigger on Compliance_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceViewHandler.handleAfterDelete(Trigger.old);
    }
}

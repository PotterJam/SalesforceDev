trigger ComplianceControllerTrigger on Compliance_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceControllerHandler.handleAfterDelete(Trigger.old);
    }
}

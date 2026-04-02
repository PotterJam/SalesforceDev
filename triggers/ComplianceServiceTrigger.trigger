trigger ComplianceServiceTrigger on Compliance_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceServiceHandler.handleAfterDelete(Trigger.old);
    }
}

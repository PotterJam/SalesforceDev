trigger ComplianceNodeTrigger on Compliance_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceNodeHandler.handleAfterDelete(Trigger.old);
    }
}

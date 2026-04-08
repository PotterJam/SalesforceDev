trigger ComplianceFlowTrigger on Compliance_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceFlowHandler.handleAfterDelete(Trigger.old);
    }
}

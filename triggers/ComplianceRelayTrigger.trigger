trigger ComplianceRelayTrigger on Compliance_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRelayHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ComplianceBridgeTrigger on Compliance_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceBridgeHandler.handleAfterDelete(Trigger.old);
    }
}

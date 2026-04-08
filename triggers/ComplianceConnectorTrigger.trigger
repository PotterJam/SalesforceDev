trigger ComplianceConnectorTrigger on Compliance_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceConnectorHandler.handleAfterDelete(Trigger.old);
    }
}

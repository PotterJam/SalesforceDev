trigger ComplianceEndpointTrigger on Compliance_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

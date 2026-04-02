trigger SeverityEndpointTrigger on Severity_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

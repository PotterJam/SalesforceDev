trigger CoverageEndpointTrigger on Coverage_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

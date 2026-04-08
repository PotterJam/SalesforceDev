trigger VarianceEndpointTrigger on Variance_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

trigger UtilizationEndpointTrigger on Utilization_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

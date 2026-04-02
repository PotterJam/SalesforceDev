trigger LogisticsEndpointTrigger on Logistics_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

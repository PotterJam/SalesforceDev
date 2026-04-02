trigger TerritoryEndpointTrigger on Territory_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

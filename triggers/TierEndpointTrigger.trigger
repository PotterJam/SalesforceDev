trigger TierEndpointTrigger on Tier_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

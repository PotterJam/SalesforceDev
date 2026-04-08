trigger ChannelEndpointTrigger on Channel_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

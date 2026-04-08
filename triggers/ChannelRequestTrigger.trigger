trigger ChannelRequestTrigger on Channel_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRequestHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ChannelRouteTrigger on Channel_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRouteHandler.handleAfterDelete(Trigger.old);
    }
}

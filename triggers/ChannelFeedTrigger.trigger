trigger ChannelFeedTrigger on Channel_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelFeedHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ChannelEventTrigger on Channel_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEventHandler.handleAfterDelete(Trigger.old);
    }
}

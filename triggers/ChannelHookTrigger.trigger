trigger ChannelHookTrigger on Channel_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelHookHandler.handleAfterDelete(Trigger.old);
    }
}

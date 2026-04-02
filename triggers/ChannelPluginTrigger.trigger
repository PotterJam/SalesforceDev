trigger ChannelPluginTrigger on Channel_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPluginHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ChannelCacheTrigger on Channel_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelCacheHandler.handleAfterDelete(Trigger.old);
    }
}

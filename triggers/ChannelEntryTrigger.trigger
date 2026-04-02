trigger ChannelEntryTrigger on Channel_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelEntryHandler.handleAfterDelete(Trigger.old);
    }
}

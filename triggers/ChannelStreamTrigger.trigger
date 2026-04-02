trigger ChannelStreamTrigger on Channel_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelStreamHandler.handleAfterDelete(Trigger.old);
    }
}

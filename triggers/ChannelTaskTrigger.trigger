trigger ChannelTaskTrigger on Channel_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelTaskHandler.handleAfterDelete(Trigger.old);
    }
}

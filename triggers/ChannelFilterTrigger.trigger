trigger ChannelFilterTrigger on Channel_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelFilterHandler.handleAfterDelete(Trigger.old);
    }
}

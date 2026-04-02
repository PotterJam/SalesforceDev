trigger ChannelViewTrigger on Channel_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelViewHandler.handleAfterDelete(Trigger.old);
    }
}

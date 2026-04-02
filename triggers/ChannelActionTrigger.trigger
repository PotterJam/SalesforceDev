trigger ChannelActionTrigger on Channel_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelActionHandler.handleAfterDelete(Trigger.old);
    }
}

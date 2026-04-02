trigger ChannelDetailTrigger on Channel_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelDetailHandler.handleAfterDelete(Trigger.old);
    }
}

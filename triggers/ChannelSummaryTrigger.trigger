trigger ChannelSummaryTrigger on Channel_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSummaryHandler.handleAfterDelete(Trigger.old);
    }
}

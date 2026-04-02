trigger ChannelBatchTrigger on Channel_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBatchHandler.handleAfterDelete(Trigger.old);
    }
}

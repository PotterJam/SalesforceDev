trigger ChannelAggregateTrigger on Channel_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

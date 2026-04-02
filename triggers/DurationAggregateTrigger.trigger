trigger DurationAggregateTrigger on Duration_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

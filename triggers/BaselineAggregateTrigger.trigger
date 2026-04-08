trigger BaselineAggregateTrigger on Baseline_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

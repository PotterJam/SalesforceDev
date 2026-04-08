trigger TargetAggregateTrigger on Target_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

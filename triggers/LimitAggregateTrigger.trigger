trigger LimitAggregateTrigger on Limit_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

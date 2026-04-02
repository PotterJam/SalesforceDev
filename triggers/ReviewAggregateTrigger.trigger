trigger ReviewAggregateTrigger on Review_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

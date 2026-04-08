trigger CustomerAggregateTrigger on Customer_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

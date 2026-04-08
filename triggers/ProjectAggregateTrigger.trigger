trigger ProjectAggregateTrigger on Project_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

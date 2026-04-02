trigger UtilizationAggregateTrigger on Utilization_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

trigger DependencyAggregateTrigger on Dependency_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

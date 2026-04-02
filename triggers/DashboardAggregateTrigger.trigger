trigger DashboardAggregateTrigger on Dashboard_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

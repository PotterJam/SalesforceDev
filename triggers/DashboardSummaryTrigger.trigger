trigger DashboardSummaryTrigger on Dashboard_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardSummaryHandler.handleAfterDelete(Trigger.old);
    }
}

trigger DashboardActionTrigger on Dashboard_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardActionHandler.handleAfterDelete(Trigger.old);
    }
}

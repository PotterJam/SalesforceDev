trigger DashboardPlanTrigger on Dashboard_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardPlanHandler.handleAfterDelete(Trigger.old);
    }
}

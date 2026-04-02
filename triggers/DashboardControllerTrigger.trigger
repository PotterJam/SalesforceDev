trigger DashboardControllerTrigger on Dashboard_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardControllerHandler.handleAfterDelete(Trigger.old);
    }
}

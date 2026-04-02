trigger DashboardBindingTrigger on Dashboard_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBindingHandler.handleAfterDelete(Trigger.old);
    }
}

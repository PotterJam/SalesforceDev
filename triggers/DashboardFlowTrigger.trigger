trigger DashboardFlowTrigger on Dashboard_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardFlowHandler.handleAfterDelete(Trigger.old);
    }
}

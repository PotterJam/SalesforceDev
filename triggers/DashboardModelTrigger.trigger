trigger DashboardModelTrigger on Dashboard_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardModelHandler.handleAfterDelete(Trigger.old);
    }
}

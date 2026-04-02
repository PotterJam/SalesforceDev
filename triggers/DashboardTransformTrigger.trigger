trigger DashboardTransformTrigger on Dashboard_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTransformHandler.handleAfterDelete(Trigger.old);
    }
}

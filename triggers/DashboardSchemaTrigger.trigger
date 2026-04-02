trigger DashboardSchemaTrigger on Dashboard_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardSchemaHandler.handleAfterDelete(Trigger.old);
    }
}

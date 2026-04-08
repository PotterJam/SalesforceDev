trigger DashboardTransactionTrigger on Dashboard_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

trigger BillingPluginTrigger on Billing_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPluginHandler.handleAfterDelete(Trigger.old);
    }
}

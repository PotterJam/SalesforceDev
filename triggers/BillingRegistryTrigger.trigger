trigger BillingRegistryTrigger on Billing_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRegistryHandler.handleAfterDelete(Trigger.old);
    }
}

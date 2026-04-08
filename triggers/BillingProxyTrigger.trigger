trigger BillingProxyTrigger on Billing_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingProxyHandler.handleAfterDelete(Trigger.old);
    }
}

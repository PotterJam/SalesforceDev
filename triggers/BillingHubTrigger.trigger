trigger BillingHubTrigger on Billing_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHubHandler.handleAfterDelete(Trigger.old);
    }
}

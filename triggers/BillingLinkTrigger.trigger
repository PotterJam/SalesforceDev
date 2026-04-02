trigger BillingLinkTrigger on Billing_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingLinkHandler.handleAfterDelete(Trigger.old);
    }
}

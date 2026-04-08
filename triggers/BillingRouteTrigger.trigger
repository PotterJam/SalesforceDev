trigger BillingRouteTrigger on Billing_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRouteHandler.handleAfterDelete(Trigger.old);
    }
}

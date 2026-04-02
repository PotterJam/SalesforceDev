trigger BillingPlanTrigger on Billing_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPlanHandler.handleAfterDelete(Trigger.old);
    }
}

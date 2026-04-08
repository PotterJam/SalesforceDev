trigger BillingRelayTrigger on Billing_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRelayHandler.handleAfterDelete(Trigger.old);
    }
}

trigger BillingMappingTrigger on Billing_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingMappingHandler.handleAfterDelete(Trigger.old);
    }
}

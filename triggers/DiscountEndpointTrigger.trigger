trigger DiscountEndpointTrigger on Discount_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

trigger DiscountGatewayTrigger on Discount_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountGatewayHandler.handleAfterDelete(Trigger.old);
    }
}

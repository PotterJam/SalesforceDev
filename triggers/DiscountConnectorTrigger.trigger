trigger DiscountConnectorTrigger on Discount_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountConnectorHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ShippingTransactionTrigger on Shipping_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

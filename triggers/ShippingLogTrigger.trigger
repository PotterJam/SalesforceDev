trigger ShippingLogTrigger on Shipping_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingLogHandler.handleAfterDelete(Trigger.old);
    }
}

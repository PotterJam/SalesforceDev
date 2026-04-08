trigger ShippingStreamTrigger on Shipping_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingStreamHandler.handleAfterDelete(Trigger.old);
    }
}

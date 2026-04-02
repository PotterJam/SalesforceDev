trigger ShippingRecordTrigger on Shipping_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingRecordHandler.handleAfterDelete(Trigger.old);
    }
}

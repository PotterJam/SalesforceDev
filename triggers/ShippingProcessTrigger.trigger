trigger ShippingProcessTrigger on Shipping_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingProcessHandler.handleAfterDelete(Trigger.old);
    }
}

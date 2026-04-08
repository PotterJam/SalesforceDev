trigger ShippingDetailTrigger on Shipping_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDetailHandler.handleAfterDelete(Trigger.old);
    }
}

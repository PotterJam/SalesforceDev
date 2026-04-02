trigger ShippingAuditTrigger on Shipping_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingAuditHandler.handleAfterDelete(Trigger.old);
    }
}

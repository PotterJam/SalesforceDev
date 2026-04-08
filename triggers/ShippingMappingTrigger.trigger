trigger ShippingMappingTrigger on Shipping_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingMappingHandler.handleAfterDelete(Trigger.old);
    }
}

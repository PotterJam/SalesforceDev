trigger ShippingConnectorTrigger on Shipping_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingConnectorHandler.handleAfterDelete(Trigger.old);
    }
}

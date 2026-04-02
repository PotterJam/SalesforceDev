trigger ShippingSchemaTrigger on Shipping_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingSchemaHandler.handleAfterDelete(Trigger.old);
    }
}

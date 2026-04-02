trigger ShippingProcessorTrigger on Shipping_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

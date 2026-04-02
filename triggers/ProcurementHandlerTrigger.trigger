trigger ProcurementHandlerTrigger on Procurement_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

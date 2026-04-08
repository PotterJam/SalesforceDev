trigger ProcurementProcessorTrigger on Procurement_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

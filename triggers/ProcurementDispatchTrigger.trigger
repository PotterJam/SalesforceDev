trigger ProcurementDispatchTrigger on Procurement_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

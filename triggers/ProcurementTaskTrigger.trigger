trigger ProcurementTaskTrigger on Procurement_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementTaskHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ProcurementProcessTrigger on Procurement_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementProcessHandler.handleAfterDelete(Trigger.old);
    }
}

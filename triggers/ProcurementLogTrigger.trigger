trigger ProcurementLogTrigger on Procurement_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementLogHandler.handleAfterDelete(Trigger.old);
    }
}

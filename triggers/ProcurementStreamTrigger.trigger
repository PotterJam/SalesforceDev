trigger ProcurementStreamTrigger on Procurement_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementStreamHandler.handleAfterDelete(Trigger.old);
    }
}

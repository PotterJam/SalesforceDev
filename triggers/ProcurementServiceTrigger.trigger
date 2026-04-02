trigger ProcurementServiceTrigger on Procurement_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementServiceHandler.handleAfterDelete(Trigger.old);
    }
}

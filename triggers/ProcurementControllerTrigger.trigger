trigger ProcurementControllerTrigger on Procurement_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementControllerHandler.handleAfterDelete(Trigger.old);
    }
}

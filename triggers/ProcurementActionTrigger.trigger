trigger ProcurementActionTrigger on Procurement_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementActionHandler.handleAfterDelete(Trigger.old);
    }
}

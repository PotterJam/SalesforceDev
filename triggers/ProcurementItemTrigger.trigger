trigger ProcurementItemTrigger on Procurement_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementItemHandler.handleAfterDelete(Trigger.old);
    }
}

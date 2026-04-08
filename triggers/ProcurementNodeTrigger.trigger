trigger ProcurementNodeTrigger on Procurement_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementNodeHandler.handleAfterDelete(Trigger.old);
    }
}

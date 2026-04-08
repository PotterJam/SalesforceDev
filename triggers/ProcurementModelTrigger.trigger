trigger ProcurementModelTrigger on Procurement_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementModelHandler.handleAfterDelete(Trigger.old);
    }
}

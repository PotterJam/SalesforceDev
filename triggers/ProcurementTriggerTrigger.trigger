trigger ProcurementTriggerTrigger on Procurement_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

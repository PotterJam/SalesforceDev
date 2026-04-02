trigger ProcurementHookTrigger on Procurement_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHookHandler.handleAfterDelete(Trigger.old);
    }
}

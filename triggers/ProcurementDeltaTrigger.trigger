trigger ProcurementDeltaTrigger on Procurement_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ProcurementAdapterTrigger on Procurement_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementAdapterHandler.handleAfterDelete(Trigger.old);
    }
}

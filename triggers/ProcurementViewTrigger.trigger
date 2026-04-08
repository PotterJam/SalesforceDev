trigger ProcurementViewTrigger on Procurement_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementViewHandler.handleAfterDelete(Trigger.old);
    }
}

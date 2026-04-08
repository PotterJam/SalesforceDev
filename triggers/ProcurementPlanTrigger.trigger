trigger ProcurementPlanTrigger on Procurement_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPlanHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ProcurementHubTrigger on Procurement_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementHubHandler.handleAfterDelete(Trigger.old);
    }
}

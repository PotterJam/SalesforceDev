trigger ProcurementStageTrigger on Procurement_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementStageHandler.handleAfterDelete(Trigger.old);
    }
}

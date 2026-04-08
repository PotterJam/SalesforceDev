trigger PhaseBatchTrigger on Phase_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseBatchHandler.handleAfterDelete(Trigger.old);
    }
}

trigger BaselineDispatchTrigger on Baseline_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

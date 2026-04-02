trigger BaselineHookTrigger on Baseline_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineHookHandler.handleAfterDelete(Trigger.old);
    }
}

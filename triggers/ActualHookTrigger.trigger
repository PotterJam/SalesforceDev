trigger ActualHookTrigger on Actual_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualHookHandler.handleAfterDelete(Trigger.old);
    }
}

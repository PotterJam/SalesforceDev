trigger DurationHookTrigger on Duration_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationHookHandler.handleAfterDelete(Trigger.old);
    }
}

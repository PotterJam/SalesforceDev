trigger SupportHookTrigger on Support_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportHookHandler.handleAfterDelete(Trigger.old);
    }
}

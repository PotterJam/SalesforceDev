trigger TagHookTrigger on Tag_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagHookHandler.handleAfterDelete(Trigger.old);
    }
}

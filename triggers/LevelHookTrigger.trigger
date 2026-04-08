trigger LevelHookTrigger on Level_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelHookHandler.handleAfterDelete(Trigger.old);
    }
}

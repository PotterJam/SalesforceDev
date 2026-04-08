trigger ScoreHookTrigger on Score_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreHookHandler.handleAfterDelete(Trigger.old);
    }
}

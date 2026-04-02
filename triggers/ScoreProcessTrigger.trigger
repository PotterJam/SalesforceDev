trigger ScoreProcessTrigger on Score_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreProcessHandler.handleAfterDelete(Trigger.old);
    }
}

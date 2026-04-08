trigger ScoreJobTrigger on Score_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreJobHandler.handleAfterDelete(Trigger.old);
    }
}

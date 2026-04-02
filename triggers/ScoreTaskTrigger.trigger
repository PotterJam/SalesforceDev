trigger ScoreTaskTrigger on Score_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTaskHandler.handleAfterDelete(Trigger.old);
    }
}

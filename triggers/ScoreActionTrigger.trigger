trigger ScoreActionTrigger on Score_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreActionHandler.handleAfterDelete(Trigger.old);
    }
}

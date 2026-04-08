trigger ScoreServiceTrigger on Score_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreServiceHandler.handleAfterDelete(Trigger.old);
    }
}

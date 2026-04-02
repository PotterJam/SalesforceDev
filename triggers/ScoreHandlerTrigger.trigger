trigger ScoreHandlerTrigger on Score_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

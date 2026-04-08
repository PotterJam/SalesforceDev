trigger ScoreEventTrigger on Score_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreEventHandler.handleAfterDelete(Trigger.old);
    }
}

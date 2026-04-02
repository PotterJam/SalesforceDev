trigger ScoreFilterTrigger on Score_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreFilterHandler.handleAfterDelete(Trigger.old);
    }
}

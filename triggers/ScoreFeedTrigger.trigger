trigger ScoreFeedTrigger on Score_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreFeedHandler.handleAfterDelete(Trigger.old);
    }
}

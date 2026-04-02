trigger RatingFeedTrigger on Rating_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFeedHandler.handleAfterDelete(Trigger.old);
    }
}

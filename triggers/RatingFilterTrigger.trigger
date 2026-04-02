trigger RatingFilterTrigger on Rating_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFilterHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatingJobTrigger on Rating_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingJobHandler.handleAfterDelete(Trigger.old);
    }
}

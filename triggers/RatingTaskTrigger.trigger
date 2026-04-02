trigger RatingTaskTrigger on Rating_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTaskHandler.handleAfterDelete(Trigger.old);
    }
}

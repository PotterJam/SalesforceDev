trigger RatingControllerTrigger on Rating_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingControllerHandler.handleAfterDelete(Trigger.old);
    }
}

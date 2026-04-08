trigger RatingHookTrigger on Rating_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingHookHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatingDeltaTrigger on Rating_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatingHubTrigger on Rating_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingHubHandler.handleAfterDelete(Trigger.old);
    }
}

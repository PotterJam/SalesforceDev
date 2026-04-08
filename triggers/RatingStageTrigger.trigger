trigger RatingStageTrigger on Rating_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingStageHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatingPlanTrigger on Rating_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingPlanHandler.handleAfterDelete(Trigger.old);
    }
}

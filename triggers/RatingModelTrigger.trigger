trigger RatingModelTrigger on Rating_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingModelHandler.handleAfterDelete(Trigger.old);
    }
}

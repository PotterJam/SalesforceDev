trigger RatingItemTrigger on Rating_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingItemHandler.handleAfterDelete(Trigger.old);
    }
}

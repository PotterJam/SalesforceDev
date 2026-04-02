trigger RatingEntryTrigger on Rating_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingEntryHandler.handleAfterDelete(Trigger.old);
    }
}

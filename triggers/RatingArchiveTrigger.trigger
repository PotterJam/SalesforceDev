trigger RatingArchiveTrigger on Rating_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingArchiveHandler.handleAfterDelete(Trigger.old);
    }
}

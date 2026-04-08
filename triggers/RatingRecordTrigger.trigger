trigger RatingRecordTrigger on Rating_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRecordHandler.handleAfterDelete(Trigger.old);
    }
}

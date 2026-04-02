trigger RatingConfigTrigger on Rating_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingConfigHandler.handleAfterDelete(Trigger.old);
    }
}

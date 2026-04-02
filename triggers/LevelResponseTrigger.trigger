trigger LevelResponseTrigger on Level_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelResponseHandler.handleAfterDelete(Trigger.old);
    }
}

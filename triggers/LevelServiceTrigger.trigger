trigger LevelServiceTrigger on Level_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelServiceHandler.handleAfterDelete(Trigger.old);
    }
}

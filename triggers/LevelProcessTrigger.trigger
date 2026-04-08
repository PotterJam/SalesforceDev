trigger LevelProcessTrigger on Level_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelProcessHandler.handleAfterDelete(Trigger.old);
    }
}

trigger LevelEventTrigger on Level_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelEventHandler.handleAfterDelete(Trigger.old);
    }
}

trigger LevelConfigTrigger on Level_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelConfigHandler.handleAfterDelete(Trigger.old);
    }
}

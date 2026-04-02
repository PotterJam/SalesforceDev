trigger LevelSettingTrigger on Level_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSettingHandler.handleAfterDelete(Trigger.old);
    }
}

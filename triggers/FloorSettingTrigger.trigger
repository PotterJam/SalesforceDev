trigger FloorSettingTrigger on Floor_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorSettingHandler.handleAfterDelete(Trigger.old);
    }
}

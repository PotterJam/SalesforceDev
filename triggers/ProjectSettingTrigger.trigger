trigger ProjectSettingTrigger on Project_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSettingHandler.handleAfterDelete(Trigger.old);
    }
}

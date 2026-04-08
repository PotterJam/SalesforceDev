trigger TrainingSettingTrigger on Training_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingSettingHandler.handleAfterDelete(Trigger.old);
    }
}

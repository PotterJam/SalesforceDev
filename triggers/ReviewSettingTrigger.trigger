trigger ReviewSettingTrigger on Review_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSettingHandler.handleAfterDelete(Trigger.old);
    }
}

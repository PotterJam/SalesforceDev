trigger ResourceSettingTrigger on Resource_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSettingHandler.handleAfterDelete(Trigger.old);
    }
}

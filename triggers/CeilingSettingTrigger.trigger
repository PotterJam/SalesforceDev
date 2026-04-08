trigger CeilingSettingTrigger on Ceiling_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSettingHandler.handleAfterDelete(Trigger.old);
    }
}

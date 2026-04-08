trigger IndexSettingTrigger on Index_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSettingHandler.handleAfterDelete(Trigger.old);
    }
}

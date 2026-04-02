trigger ProductSettingTrigger on Product_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSettingHandler.handleAfterDelete(Trigger.old);
    }
}

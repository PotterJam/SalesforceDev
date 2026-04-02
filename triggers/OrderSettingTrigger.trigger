trigger OrderSettingTrigger on Order_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderSettingHandler.handleAfterDelete(Trigger.old);
    }
}

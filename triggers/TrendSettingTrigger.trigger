trigger TrendSettingTrigger on Trend_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSettingHandler.handleAfterDelete(Trigger.old);
    }
}

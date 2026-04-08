trigger MarketingSettingTrigger on Marketing_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSettingHandler.handleAfterDelete(Trigger.old);
    }
}

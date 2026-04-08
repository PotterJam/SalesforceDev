trigger LogisticsSettingTrigger on Logistics_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSettingHandler.handleAfterDelete(Trigger.old);
    }
}

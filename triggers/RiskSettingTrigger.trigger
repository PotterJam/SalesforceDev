trigger RiskSettingTrigger on Risk_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskSettingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger BaselineSettingTrigger on Baseline_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineSettingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ThresholdSettingTrigger on Threshold_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSettingHandler.handleAfterDelete(Trigger.old);
    }
}

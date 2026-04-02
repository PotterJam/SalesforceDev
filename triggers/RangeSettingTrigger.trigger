trigger RangeSettingTrigger on Range_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSettingHandler.handleAfterDelete(Trigger.old);
    }
}

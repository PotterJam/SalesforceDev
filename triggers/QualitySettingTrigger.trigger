trigger QualitySettingTrigger on Quality_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualitySettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualitySettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySettingHandler.handleAfterDelete(Trigger.old);
    }
}

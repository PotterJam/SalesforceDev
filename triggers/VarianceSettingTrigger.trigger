trigger VarianceSettingTrigger on Variance_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceSettingHandler.handleAfterDelete(Trigger.old);
    }
}

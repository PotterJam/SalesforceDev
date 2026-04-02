trigger CommissionSettingTrigger on Commission_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSettingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger UtilizationSettingTrigger on Utilization_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationSettingHandler.handleAfterDelete(Trigger.old);
    }
}

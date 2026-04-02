trigger CapacitySettingTrigger on Capacity_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacitySettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacitySettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySettingHandler.handleAfterDelete(Trigger.old);
    }
}

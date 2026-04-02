trigger CustomerSettingTrigger on Customer_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSettingHandler.handleAfterDelete(Trigger.old);
    }
}

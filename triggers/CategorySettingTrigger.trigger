trigger CategorySettingTrigger on Category_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategorySettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategorySettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategorySettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategorySettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategorySettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategorySettingHandler.handleAfterDelete(Trigger.old);
    }
}

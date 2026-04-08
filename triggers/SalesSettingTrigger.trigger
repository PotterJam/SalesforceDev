trigger SalesSettingTrigger on Sales_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesSettingHandler.handleAfterDelete(Trigger.old);
    }
}

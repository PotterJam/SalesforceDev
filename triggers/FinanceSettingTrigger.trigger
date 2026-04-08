trigger FinanceSettingTrigger on Finance_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceSettingHandler.handleAfterDelete(Trigger.old);
    }
}

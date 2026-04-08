trigger BudgetSettingTrigger on Budget_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSettingHandler.handleAfterDelete(Trigger.old);
    }
}

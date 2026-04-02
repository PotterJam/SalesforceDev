trigger BudgetRecordTrigger on Budget_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRecordHandler.handleAfterDelete(Trigger.old);
    }
}

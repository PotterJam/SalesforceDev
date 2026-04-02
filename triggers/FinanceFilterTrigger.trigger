trigger FinanceFilterTrigger on Finance_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFilterHandler.handleAfterDelete(Trigger.old);
    }
}

trigger FinanceHookTrigger on Finance_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHookHandler.handleAfterDelete(Trigger.old);
    }
}

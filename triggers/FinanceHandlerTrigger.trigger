trigger FinanceHandlerTrigger on Finance_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

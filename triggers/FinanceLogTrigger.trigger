trigger FinanceLogTrigger on Finance_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceLogHandler.handleAfterDelete(Trigger.old);
    }
}

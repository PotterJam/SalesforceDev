trigger FinanceQueueTrigger on Finance_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceQueueHandler.handleAfterDelete(Trigger.old);
    }
}

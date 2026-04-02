trigger FinanceRequestTrigger on Finance_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRequestHandler.handleAfterDelete(Trigger.old);
    }
}

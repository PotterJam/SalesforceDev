trigger FinanceEventTrigger on Finance_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceEventHandler.handleAfterDelete(Trigger.old);
    }
}

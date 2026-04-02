trigger FinanceNodeTrigger on Finance_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceNodeHandler.handleAfterDelete(Trigger.old);
    }
}

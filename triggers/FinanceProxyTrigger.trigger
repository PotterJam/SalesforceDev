trigger FinanceProxyTrigger on Finance_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceProxyHandler.handleAfterDelete(Trigger.old);
    }
}

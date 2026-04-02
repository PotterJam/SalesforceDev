trigger SalesProxyTrigger on Sales_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesProxyHandler.handleAfterDelete(Trigger.old);
    }
}

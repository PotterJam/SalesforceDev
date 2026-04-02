trigger ActualProxyTrigger on Actual_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProxyHandler.handleAfterDelete(Trigger.old);
    }
}

trigger TrendProxyTrigger on Trend_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProxyHandler.handleAfterDelete(Trigger.old);
    }
}

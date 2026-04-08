trigger LimitProxyTrigger on Limit_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitProxyHandler.handleAfterDelete(Trigger.old);
    }
}

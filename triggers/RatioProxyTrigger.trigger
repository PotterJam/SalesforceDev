trigger RatioProxyTrigger on Ratio_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProxyHandler.handleAfterDelete(Trigger.old);
    }
}

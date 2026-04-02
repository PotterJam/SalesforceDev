trigger RangeProxyTrigger on Range_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeProxyHandler.handleAfterDelete(Trigger.old);
    }
}

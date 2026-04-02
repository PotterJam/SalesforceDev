trigger ResourceProxyTrigger on Resource_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceProxyHandler.handleAfterDelete(Trigger.old);
    }
}

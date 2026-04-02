trigger SupportProxyTrigger on Support_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportProxyHandler.handleAfterDelete(Trigger.old);
    }
}

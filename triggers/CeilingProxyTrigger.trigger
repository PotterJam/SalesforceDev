trigger CeilingProxyTrigger on Ceiling_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingProxyHandler.handleAfterDelete(Trigger.old);
    }
}

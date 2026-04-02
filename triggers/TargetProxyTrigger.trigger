trigger TargetProxyTrigger on Target_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetProxyHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PhaseProxyTrigger on Phase_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseProxyHandler.handleAfterDelete(Trigger.old);
    }
}

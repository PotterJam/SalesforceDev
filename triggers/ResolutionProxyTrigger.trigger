trigger ResolutionProxyTrigger on Resolution_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProxyHandler.handleAfterDelete(Trigger.old);
    }
}

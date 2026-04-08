trigger CoverageProxyTrigger on Coverage_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageProxyHandler.handleAfterDelete(Trigger.old);
    }
}

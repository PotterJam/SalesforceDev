trigger BaselineProxyTrigger on Baseline_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProxyHandler.handleAfterDelete(Trigger.old);
    }
}

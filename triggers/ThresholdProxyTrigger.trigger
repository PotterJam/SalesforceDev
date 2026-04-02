trigger ThresholdProxyTrigger on Threshold_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdProxyHandler.handleAfterDelete(Trigger.old);
    }
}

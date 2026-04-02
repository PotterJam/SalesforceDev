trigger CommissionProxyTrigger on Commission_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionProxyHandler.handleAfterDelete(Trigger.old);
    }
}

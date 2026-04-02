trigger LogisticsProxyTrigger on Logistics_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsProxyHandler.handleAfterDelete(Trigger.old);
    }
}

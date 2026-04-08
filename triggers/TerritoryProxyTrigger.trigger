trigger TerritoryProxyTrigger on Territory_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryProxyHandler.handleAfterDelete(Trigger.old);
    }
}

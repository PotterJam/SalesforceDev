trigger TerritoryTriggerTrigger on Territory_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

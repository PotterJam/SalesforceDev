trigger TerritoryEventTrigger on Territory_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEventHandler.handleAfterDelete(Trigger.old);
    }
}

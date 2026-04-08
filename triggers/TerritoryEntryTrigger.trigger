trigger TerritoryEntryTrigger on Territory_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryEntryHandler.handleAfterDelete(Trigger.old);
    }
}

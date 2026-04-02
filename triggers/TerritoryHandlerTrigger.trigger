trigger TerritoryHandlerTrigger on Territory_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

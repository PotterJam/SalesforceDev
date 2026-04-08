trigger TerritoryLogTrigger on Territory_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryLogHandler.handleAfterDelete(Trigger.old);
    }
}

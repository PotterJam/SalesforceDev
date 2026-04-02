trigger TerritoryTransactionTrigger on Territory_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

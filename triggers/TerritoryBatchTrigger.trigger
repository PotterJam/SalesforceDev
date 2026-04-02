trigger TerritoryBatchTrigger on Territory_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBatchHandler.handleAfterDelete(Trigger.old);
    }
}

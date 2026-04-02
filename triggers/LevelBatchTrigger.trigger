trigger LevelBatchTrigger on Level_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelBatchHandler.handleAfterDelete(Trigger.old);
    }
}

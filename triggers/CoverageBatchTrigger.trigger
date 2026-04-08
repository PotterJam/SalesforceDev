trigger CoverageBatchTrigger on Coverage_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageBatchHandler.handleAfterDelete(Trigger.old);
    }
}

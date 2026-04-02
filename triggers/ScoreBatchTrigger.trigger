trigger ScoreBatchTrigger on Score_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreBatchHandler.handleAfterDelete(Trigger.old);
    }
}

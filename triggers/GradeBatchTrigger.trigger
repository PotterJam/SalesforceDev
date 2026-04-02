trigger GradeBatchTrigger on Grade_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBatchHandler.handleAfterDelete(Trigger.old);
    }
}

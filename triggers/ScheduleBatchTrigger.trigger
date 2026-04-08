trigger ScheduleBatchTrigger on Schedule_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleBatchHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatioBatchTrigger on Ratio_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioBatchHandler.handleAfterDelete(Trigger.old);
    }
}

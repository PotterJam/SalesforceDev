trigger ActualJobTrigger on Actual_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualJobHandler.handleAfterDelete(Trigger.old);
    }
}

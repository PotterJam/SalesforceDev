trigger ActualTaskTrigger on Actual_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTaskHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ActualManagerTrigger on Actual_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualManagerHandler.handleAfterDelete(Trigger.old);
    }
}

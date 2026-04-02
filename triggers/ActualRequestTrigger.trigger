trigger ActualRequestTrigger on Actual_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRequestHandler.handleAfterDelete(Trigger.old);
    }
}

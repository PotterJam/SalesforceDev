trigger BaselineRequestTrigger on Baseline_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRequestHandler.handleAfterDelete(Trigger.old);
    }
}

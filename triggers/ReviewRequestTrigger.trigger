trigger ReviewRequestTrigger on Review_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRequestHandler.handleAfterDelete(Trigger.old);
    }
}

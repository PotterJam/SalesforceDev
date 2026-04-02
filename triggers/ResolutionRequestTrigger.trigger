trigger ResolutionRequestTrigger on Resolution_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionRequestHandler.handleAfterDelete(Trigger.old);
    }
}

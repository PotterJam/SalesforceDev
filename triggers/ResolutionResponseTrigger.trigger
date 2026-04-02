trigger ResolutionResponseTrigger on Resolution_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionResponseHandler.handleAfterDelete(Trigger.old);
    }
}

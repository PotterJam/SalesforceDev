trigger ResearchResponseTrigger on Research_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchResponseHandler.handleAfterDelete(Trigger.old);
    }
}

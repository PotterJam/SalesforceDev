trigger ProjectFeedTrigger on Project_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectFeedHandler.handleAfterDelete(Trigger.old);
    }
}

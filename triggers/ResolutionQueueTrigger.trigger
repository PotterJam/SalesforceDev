trigger ResolutionQueueTrigger on Resolution_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionQueueHandler.handleAfterDelete(Trigger.old);
    }
}

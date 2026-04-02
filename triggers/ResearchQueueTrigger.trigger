trigger ResearchQueueTrigger on Research_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchQueueHandler.handleAfterDelete(Trigger.old);
    }
}

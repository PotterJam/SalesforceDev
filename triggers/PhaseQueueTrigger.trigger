trigger PhaseQueueTrigger on Phase_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseQueueHandler.handleAfterDelete(Trigger.old);
    }
}

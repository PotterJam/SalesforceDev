trigger DeliverableQueueTrigger on Deliverable_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableQueueHandler.handleAfterDelete(Trigger.old);
    }
}

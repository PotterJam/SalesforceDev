trigger FloorQueueTrigger on Floor_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorQueueHandler.handleAfterDelete(Trigger.old);
    }
}

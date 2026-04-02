trigger AlertQueueTrigger on Alert_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertQueueHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PriorityStreamTrigger on Priority_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityStreamHandler.handleAfterDelete(Trigger.old);
    }
}

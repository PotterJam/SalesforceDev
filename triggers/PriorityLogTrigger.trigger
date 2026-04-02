trigger PriorityLogTrigger on Priority_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityLogHandler.handleAfterDelete(Trigger.old);
    }
}

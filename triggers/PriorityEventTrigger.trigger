trigger PriorityEventTrigger on Priority_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEventHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PriorityServiceTrigger on Priority_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityServiceHandler.handleAfterDelete(Trigger.old);
    }
}

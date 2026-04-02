trigger PriorityResponseTrigger on Priority_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityResponseHandler.handleAfterDelete(Trigger.old);
    }
}

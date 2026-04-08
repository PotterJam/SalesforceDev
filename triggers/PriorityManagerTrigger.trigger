trigger PriorityManagerTrigger on Priority_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityManagerHandler.handleAfterDelete(Trigger.old);
    }
}

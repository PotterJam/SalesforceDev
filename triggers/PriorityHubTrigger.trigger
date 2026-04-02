trigger PriorityHubTrigger on Priority_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityHubHandler.handleAfterDelete(Trigger.old);
    }
}

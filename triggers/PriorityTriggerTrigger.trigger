trigger PriorityTriggerTrigger on Priority_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

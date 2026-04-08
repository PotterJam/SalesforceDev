trigger PriorityBindingTrigger on Priority_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityBindingHandler.handleAfterDelete(Trigger.old);
    }
}

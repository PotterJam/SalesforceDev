trigger PriorityAdapterTrigger on Priority_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityAdapterHandler.handleAfterDelete(Trigger.old);
    }
}

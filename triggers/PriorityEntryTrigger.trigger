trigger PriorityEntryTrigger on Priority_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEntryHandler.handleAfterDelete(Trigger.old);
    }
}

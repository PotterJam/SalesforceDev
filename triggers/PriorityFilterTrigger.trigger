trigger PriorityFilterTrigger on Priority_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityFilterHandler.handleAfterDelete(Trigger.old);
    }
}

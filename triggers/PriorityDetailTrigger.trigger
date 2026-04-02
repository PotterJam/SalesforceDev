trigger PriorityDetailTrigger on Priority_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityDetailHandler.handleAfterDelete(Trigger.old);
    }
}

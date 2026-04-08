trigger PriorityNodeTrigger on Priority_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityNodeHandler.handleAfterDelete(Trigger.old);
    }
}

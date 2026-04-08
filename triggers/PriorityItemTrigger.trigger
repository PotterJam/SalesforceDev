trigger PriorityItemTrigger on Priority_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityItemHandler.handleAfterDelete(Trigger.old);
    }
}

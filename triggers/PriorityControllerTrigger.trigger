trigger PriorityControllerTrigger on Priority_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityControllerHandler.handleAfterDelete(Trigger.old);
    }
}

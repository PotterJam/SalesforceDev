trigger CapacityControllerTrigger on Capacity_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityControllerHandler.handleAfterDelete(Trigger.old);
    }
}

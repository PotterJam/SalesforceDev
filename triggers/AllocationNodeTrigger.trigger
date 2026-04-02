trigger AllocationNodeTrigger on Allocation_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationNodeHandler.handleAfterDelete(Trigger.old);
    }
}

trigger AllocationServiceTrigger on Allocation_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationServiceHandler.handleAfterDelete(Trigger.old);
    }
}

trigger AllocationConfigTrigger on Allocation_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationConfigHandler.handleAfterDelete(Trigger.old);
    }
}

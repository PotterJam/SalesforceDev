trigger AllocationHubTrigger on Allocation_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationHubHandler.handleAfterDelete(Trigger.old);
    }
}

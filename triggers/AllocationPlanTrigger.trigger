trigger AllocationPlanTrigger on Allocation_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationPlanHandler.handleAfterDelete(Trigger.old);
    }
}

trigger AllocationStageTrigger on Allocation_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationStageHandler.handleAfterDelete(Trigger.old);
    }
}

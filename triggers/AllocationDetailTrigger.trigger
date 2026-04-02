trigger AllocationDetailTrigger on Allocation_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationDetailHandler.handleAfterDelete(Trigger.old);
    }
}

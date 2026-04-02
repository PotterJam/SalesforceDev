trigger AllocationViewTrigger on Allocation_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationViewHandler.handleAfterDelete(Trigger.old);
    }
}

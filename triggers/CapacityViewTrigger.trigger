trigger CapacityViewTrigger on Capacity_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityViewHandler.handleAfterDelete(Trigger.old);
    }
}

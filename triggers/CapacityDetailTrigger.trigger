trigger CapacityDetailTrigger on Capacity_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityDetailHandler.handleAfterDelete(Trigger.old);
    }
}

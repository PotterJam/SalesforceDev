trigger CapacityJobTrigger on Capacity_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityJobHandler.handleAfterDelete(Trigger.old);
    }
}

trigger CapacityHubTrigger on Capacity_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityHubHandler.handleAfterDelete(Trigger.old);
    }
}

trigger CapacityRelayTrigger on Capacity_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityRelayHandler.handleAfterDelete(Trigger.old);
    }
}

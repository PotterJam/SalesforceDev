trigger PriorityRelayTrigger on Priority_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityRelayHandler.handleAfterDelete(Trigger.old);
    }
}

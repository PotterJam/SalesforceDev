trigger AssignmentRelayTrigger on Assignment_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRelayHandler.handleAfterDelete(Trigger.old);
    }
}

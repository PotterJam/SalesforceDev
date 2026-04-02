trigger ResearchRelayTrigger on Research_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRelayHandler.handleAfterDelete(Trigger.old);
    }
}

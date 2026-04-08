trigger SeverityRelayTrigger on Severity_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRelayHandler.handleAfterDelete(Trigger.old);
    }
}

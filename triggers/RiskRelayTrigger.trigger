trigger RiskRelayTrigger on Risk_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRelayHandler.handleAfterDelete(Trigger.old);
    }
}

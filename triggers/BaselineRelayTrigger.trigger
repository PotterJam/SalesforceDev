trigger BaselineRelayTrigger on Baseline_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRelayHandler.handleAfterDelete(Trigger.old);
    }
}

trigger DurationRelayTrigger on Duration_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRelayHandler.handleAfterDelete(Trigger.old);
    }
}

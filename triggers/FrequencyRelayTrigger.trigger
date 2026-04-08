trigger FrequencyRelayTrigger on Frequency_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyRelayHandler.handleAfterDelete(Trigger.old);
    }
}

trigger TagRelayTrigger on Tag_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRelayHandler.handleAfterDelete(Trigger.old);
    }
}

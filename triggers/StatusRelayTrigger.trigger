trigger StatusRelayTrigger on Status_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRelayHandler.handleAfterDelete(Trigger.old);
    }
}

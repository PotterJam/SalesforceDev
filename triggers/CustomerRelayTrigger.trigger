trigger CustomerRelayTrigger on Customer_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRelayHandler.handleAfterDelete(Trigger.old);
    }
}

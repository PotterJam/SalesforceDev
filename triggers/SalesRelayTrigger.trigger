trigger SalesRelayTrigger on Sales_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRelayHandler.handleAfterDelete(Trigger.old);
    }
}

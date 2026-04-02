trigger CommissionRelayTrigger on Commission_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRelayHandler.handleAfterDelete(Trigger.old);
    }
}

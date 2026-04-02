trigger UtilizationRelayTrigger on Utilization_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRelayHandler.handleAfterDelete(Trigger.old);
    }
}

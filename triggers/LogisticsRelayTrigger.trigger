trigger LogisticsRelayTrigger on Logistics_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRelayHandler.handleAfterDelete(Trigger.old);
    }
}

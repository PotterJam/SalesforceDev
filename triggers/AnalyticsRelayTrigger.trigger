trigger AnalyticsRelayTrigger on Analytics_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsRelayHandler.handleAfterDelete(Trigger.old);
    }
}

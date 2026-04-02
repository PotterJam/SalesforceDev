trigger TrendRelayTrigger on Trend_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendRelayHandler.handleAfterDelete(Trigger.old);
    }
}

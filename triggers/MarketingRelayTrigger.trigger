trigger MarketingRelayTrigger on Marketing_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRelayHandler.handleAfterDelete(Trigger.old);
    }
}

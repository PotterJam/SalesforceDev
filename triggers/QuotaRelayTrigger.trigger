trigger QuotaRelayTrigger on Quota_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaRelayHandler.handleAfterDelete(Trigger.old);
    }
}

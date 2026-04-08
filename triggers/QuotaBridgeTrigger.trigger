trigger QuotaBridgeTrigger on Quota_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBridgeHandler.handleAfterDelete(Trigger.old);
    }
}

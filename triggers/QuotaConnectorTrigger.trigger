trigger QuotaConnectorTrigger on Quota_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaConnectorHandler.handleAfterDelete(Trigger.old);
    }
}

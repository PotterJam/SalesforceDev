trigger QuotaItemTrigger on Quota_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaItemHandler.handleAfterDelete(Trigger.old);
    }
}

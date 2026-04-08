trigger QuotaTriggerTrigger on Quota_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

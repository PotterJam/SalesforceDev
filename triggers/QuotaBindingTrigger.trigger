trigger QuotaBindingTrigger on Quota_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBindingHandler.handleAfterDelete(Trigger.old);
    }
}

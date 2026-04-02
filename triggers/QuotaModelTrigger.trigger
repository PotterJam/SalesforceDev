trigger QuotaModelTrigger on Quota_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaModelHandler.handleAfterDelete(Trigger.old);
    }
}

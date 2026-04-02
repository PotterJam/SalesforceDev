trigger AffiliateBatchTrigger on Affiliate_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBatchHandler.handleAfterDelete(Trigger.old);
    }
}

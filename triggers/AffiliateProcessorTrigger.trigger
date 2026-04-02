trigger AffiliateProcessorTrigger on Affiliate_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

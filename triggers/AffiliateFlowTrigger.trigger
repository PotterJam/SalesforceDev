trigger AffiliateFlowTrigger on Affiliate_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFlowHandler.handleAfterDelete(Trigger.old);
    }
}

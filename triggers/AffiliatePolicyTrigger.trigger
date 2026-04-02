trigger AffiliatePolicyTrigger on Affiliate_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliatePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliatePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePolicyHandler.handleAfterDelete(Trigger.old);
    }
}

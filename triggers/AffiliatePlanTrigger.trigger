trigger AffiliatePlanTrigger on Affiliate_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliatePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliatePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePlanHandler.handleAfterDelete(Trigger.old);
    }
}

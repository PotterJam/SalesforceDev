trigger AffiliateTriggerTrigger on Affiliate_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

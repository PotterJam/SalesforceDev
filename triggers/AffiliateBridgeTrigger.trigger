trigger AffiliateBridgeTrigger on Affiliate_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBridgeHandler.handleAfterDelete(Trigger.old);
    }
}

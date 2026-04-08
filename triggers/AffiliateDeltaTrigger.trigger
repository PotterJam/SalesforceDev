trigger AffiliateDeltaTrigger on Affiliate_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

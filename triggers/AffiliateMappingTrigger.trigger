trigger AffiliateMappingTrigger on Affiliate_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateMappingHandler.handleAfterDelete(Trigger.old);
    }
}

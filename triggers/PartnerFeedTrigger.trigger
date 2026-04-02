trigger PartnerFeedTrigger on Partner_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFeedHandler.handleAfterDelete(Trigger.old);
    }
}

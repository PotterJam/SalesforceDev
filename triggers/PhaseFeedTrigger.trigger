trigger PhaseFeedTrigger on Phase_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseFeedHandler.handleAfterDelete(Trigger.old);
    }
}

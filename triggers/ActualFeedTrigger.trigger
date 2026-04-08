trigger ActualFeedTrigger on Actual_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualFeedHandler.handleAfterDelete(Trigger.old);
    }
}

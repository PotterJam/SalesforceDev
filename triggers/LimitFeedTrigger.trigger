trigger LimitFeedTrigger on Limit_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitFeedHandler.handleAfterDelete(Trigger.old);
    }
}

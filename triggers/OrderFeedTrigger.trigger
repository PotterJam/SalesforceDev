trigger OrderFeedTrigger on Order_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderFeedHandler.handleAfterDelete(Trigger.old);
    }
}

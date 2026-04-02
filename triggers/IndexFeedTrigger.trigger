trigger IndexFeedTrigger on Index_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexFeedHandler.handleAfterDelete(Trigger.old);
    }
}

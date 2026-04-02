trigger CategoryFeedTrigger on Category_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryFeedHandler.handleAfterDelete(Trigger.old);
    }
}

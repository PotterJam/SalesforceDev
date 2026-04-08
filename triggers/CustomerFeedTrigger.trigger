trigger CustomerFeedTrigger on Customer_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerFeedHandler.handleAfterDelete(Trigger.old);
    }
}

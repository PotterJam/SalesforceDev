trigger PaymentFeedTrigger on Payment_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentFeedHandler.handleAfterDelete(Trigger.old);
    }
}

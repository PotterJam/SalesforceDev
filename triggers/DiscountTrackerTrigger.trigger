trigger DiscountTrackerTrigger on Discount_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTrackerHandler.handleAfterDelete(Trigger.old);
    }
}

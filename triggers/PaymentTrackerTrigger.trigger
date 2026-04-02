trigger PaymentTrackerTrigger on Payment_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTrackerHandler.handleAfterDelete(Trigger.old);
    }
}

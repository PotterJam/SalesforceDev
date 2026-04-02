trigger ActualEventTrigger on Actual_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualEventHandler.handleAfterDelete(Trigger.old);
    }
}

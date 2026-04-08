trigger ActualEntryTrigger on Actual_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualEntryHandler.handleAfterDelete(Trigger.old);
    }
}

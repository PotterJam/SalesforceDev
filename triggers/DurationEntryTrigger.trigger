trigger DurationEntryTrigger on Duration_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationEntryHandler.handleAfterDelete(Trigger.old);
    }
}

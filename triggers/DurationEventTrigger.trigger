trigger DurationEventTrigger on Duration_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationEventHandler.handleAfterDelete(Trigger.old);
    }
}

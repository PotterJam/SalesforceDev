trigger DurationTaskTrigger on Duration_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTaskHandler.handleAfterDelete(Trigger.old);
    }
}

trigger DurationTriggerTrigger on Duration_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

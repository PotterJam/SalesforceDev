trigger DurationBindingTrigger on Duration_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBindingHandler.handleAfterDelete(Trigger.old);
    }
}

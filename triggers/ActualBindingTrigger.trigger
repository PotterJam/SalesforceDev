trigger ActualBindingTrigger on Actual_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBindingHandler.handleAfterDelete(Trigger.old);
    }
}

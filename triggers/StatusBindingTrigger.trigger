trigger StatusBindingTrigger on Status_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusBindingHandler.handleAfterDelete(Trigger.old);
    }
}

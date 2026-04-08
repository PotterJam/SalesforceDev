trigger ReviewBindingTrigger on Review_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewBindingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger CategoryBindingTrigger on Category_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBindingHandler.handleAfterDelete(Trigger.old);
    }
}

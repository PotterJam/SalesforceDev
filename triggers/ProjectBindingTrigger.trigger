trigger ProjectBindingTrigger on Project_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectBindingHandler.handleAfterDelete(Trigger.old);
    }
}

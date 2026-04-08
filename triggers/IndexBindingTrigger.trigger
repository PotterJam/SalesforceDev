trigger IndexBindingTrigger on Index_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexBindingHandler.handleAfterDelete(Trigger.old);
    }
}

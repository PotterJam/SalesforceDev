trigger SalesBindingTrigger on Sales_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesBindingHandler.handleAfterDelete(Trigger.old);
    }
}

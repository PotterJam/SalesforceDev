trigger LeadBindingTrigger on Lead_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBindingHandler.handleAfterDelete(Trigger.old);
    }
}

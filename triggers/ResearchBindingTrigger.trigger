trigger ResearchBindingTrigger on Research_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchBindingHandler.handleAfterDelete(Trigger.old);
    }
}

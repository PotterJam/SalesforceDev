trigger PhaseBindingTrigger on Phase_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseBindingHandler.handleAfterDelete(Trigger.old);
    }
}

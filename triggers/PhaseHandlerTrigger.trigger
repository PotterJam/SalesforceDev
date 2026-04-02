trigger PhaseHandlerTrigger on Phase_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

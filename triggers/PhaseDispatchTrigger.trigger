trigger PhaseDispatchTrigger on Phase_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PhaseEventTrigger on Phase_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseEventHandler.handleAfterDelete(Trigger.old);
    }
}

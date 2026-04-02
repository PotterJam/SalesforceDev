trigger PhaseProcessTrigger on Phase_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseProcessHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PhaseTaskTrigger on Phase_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTaskHandler.handleAfterDelete(Trigger.old);
    }
}

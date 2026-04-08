trigger PhaseActionTrigger on Phase_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseActionHandler.handleAfterDelete(Trigger.old);
    }
}

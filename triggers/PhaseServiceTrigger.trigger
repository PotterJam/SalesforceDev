trigger PhaseServiceTrigger on Phase_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseServiceHandler.handleAfterDelete(Trigger.old);
    }
}

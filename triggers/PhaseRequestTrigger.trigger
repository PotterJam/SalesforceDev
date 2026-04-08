trigger PhaseRequestTrigger on Phase_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRequestHandler.handleAfterDelete(Trigger.old);
    }
}

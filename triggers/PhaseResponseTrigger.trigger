trigger PhaseResponseTrigger on Phase_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseResponseHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PhaseJobTrigger on Phase_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseJobHandler.handleAfterDelete(Trigger.old);
    }
}

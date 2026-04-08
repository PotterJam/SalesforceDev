trigger PhaseDetailTrigger on Phase_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseDetailHandler.handleAfterDelete(Trigger.old);
    }
}

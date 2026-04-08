trigger PhaseFilterTrigger on Phase_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseFilterHandler.handleAfterDelete(Trigger.old);
    }
}

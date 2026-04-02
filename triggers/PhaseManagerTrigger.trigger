trigger PhaseManagerTrigger on Phase_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseManagerHandler.handleAfterDelete(Trigger.old);
    }
}

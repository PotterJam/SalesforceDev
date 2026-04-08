trigger PhaseTransactionTrigger on Phase_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

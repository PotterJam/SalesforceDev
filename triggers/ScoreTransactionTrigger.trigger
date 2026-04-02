trigger ScoreTransactionTrigger on Score_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

trigger LevelTransactionTrigger on Level_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

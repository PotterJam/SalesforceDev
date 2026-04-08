trigger ResearchTransactionTrigger on Research_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

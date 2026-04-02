trigger SupportTransactionTrigger on Support_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

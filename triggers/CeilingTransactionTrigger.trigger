trigger CeilingTransactionTrigger on Ceiling_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

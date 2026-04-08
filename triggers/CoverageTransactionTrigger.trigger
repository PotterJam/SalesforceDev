trigger CoverageTransactionTrigger on Coverage_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

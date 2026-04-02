trigger RiskTransactionTrigger on Risk_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

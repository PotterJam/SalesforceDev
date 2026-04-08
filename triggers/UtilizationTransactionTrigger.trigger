trigger UtilizationTransactionTrigger on Utilization_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

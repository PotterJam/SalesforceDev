trigger DependencyTransactionTrigger on Dependency_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

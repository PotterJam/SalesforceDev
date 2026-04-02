trigger ResolutionTransactionTrigger on Resolution_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

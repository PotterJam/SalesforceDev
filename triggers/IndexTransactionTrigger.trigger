trigger IndexTransactionTrigger on Index_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

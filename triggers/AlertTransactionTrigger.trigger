trigger AlertTransactionTrigger on Alert_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

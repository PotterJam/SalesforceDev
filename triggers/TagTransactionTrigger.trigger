trigger TagTransactionTrigger on Tag_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

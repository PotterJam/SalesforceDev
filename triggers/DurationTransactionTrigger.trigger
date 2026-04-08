trigger DurationTransactionTrigger on Duration_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

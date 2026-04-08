trigger FrequencyTransactionTrigger on Frequency_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

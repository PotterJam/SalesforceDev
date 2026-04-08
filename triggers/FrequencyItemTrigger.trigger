trigger FrequencyItemTrigger on Frequency_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyItemHandler.handleAfterDelete(Trigger.old);
    }
}

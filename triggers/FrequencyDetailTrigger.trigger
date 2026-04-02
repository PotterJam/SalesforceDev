trigger FrequencyDetailTrigger on Frequency_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDetailHandler.handleAfterDelete(Trigger.old);
    }
}

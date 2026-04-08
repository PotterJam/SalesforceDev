trigger FrequencyViewTrigger on Frequency_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyViewHandler.handleAfterDelete(Trigger.old);
    }
}

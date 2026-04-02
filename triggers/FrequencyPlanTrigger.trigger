trigger FrequencyPlanTrigger on Frequency_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPlanHandler.handleAfterDelete(Trigger.old);
    }
}

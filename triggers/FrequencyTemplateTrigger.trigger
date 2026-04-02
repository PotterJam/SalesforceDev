trigger FrequencyTemplateTrigger on Frequency_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

trigger RatioTemplateTrigger on Ratio_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

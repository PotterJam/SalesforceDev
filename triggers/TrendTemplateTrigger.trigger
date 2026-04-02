trigger TrendTemplateTrigger on Trend_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

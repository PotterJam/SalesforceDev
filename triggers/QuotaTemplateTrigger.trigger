trigger QuotaTemplateTrigger on Quota_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

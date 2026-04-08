trigger LogisticsTemplateTrigger on Logistics_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

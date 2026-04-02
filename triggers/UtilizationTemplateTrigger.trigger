trigger UtilizationTemplateTrigger on Utilization_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

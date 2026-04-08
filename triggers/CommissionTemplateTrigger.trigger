trigger CommissionTemplateTrigger on Commission_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

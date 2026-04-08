trigger TerritoryTemplateTrigger on Territory_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

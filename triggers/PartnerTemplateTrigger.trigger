trigger PartnerTemplateTrigger on Partner_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

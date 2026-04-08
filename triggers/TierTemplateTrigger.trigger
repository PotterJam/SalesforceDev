trigger TierTemplateTrigger on Tier_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ThresholdTemplateTrigger on Threshold_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

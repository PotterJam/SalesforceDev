trigger DeliverableTemplateTrigger on Deliverable_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

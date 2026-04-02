trigger CapacityTemplateTrigger on Capacity_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

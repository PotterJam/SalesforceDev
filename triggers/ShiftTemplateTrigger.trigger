trigger ShiftTemplateTrigger on Shift_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

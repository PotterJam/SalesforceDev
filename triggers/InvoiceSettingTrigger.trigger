trigger InvoiceSettingTrigger on Invoice_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSettingHandler.handleAfterDelete(Trigger.old);
    }
}

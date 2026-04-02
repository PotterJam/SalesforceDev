trigger InvoiceMappingTrigger on Invoice_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceMappingHandler.handleAfterDelete(Trigger.old);
    }
}

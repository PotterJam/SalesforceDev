trigger InvoiceGatewayTrigger on Invoice_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceGatewayHandler.handleAfterDelete(Trigger.old);
    }
}

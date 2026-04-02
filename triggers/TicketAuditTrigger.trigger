trigger TicketAuditTrigger on Ticket_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketAuditHandler.handleAfterDelete(Trigger.old);
    }
}

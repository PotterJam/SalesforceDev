trigger TicketProxyTrigger on Ticket_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketProxyHandler.handleAfterDelete(Trigger.old);
    }
}

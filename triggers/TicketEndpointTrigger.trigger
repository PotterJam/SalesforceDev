trigger TicketEndpointTrigger on Ticket_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketEndpointHandler.handleAfterDelete(Trigger.old);
    }
}

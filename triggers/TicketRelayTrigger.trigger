trigger TicketRelayTrigger on Ticket_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketRelayHandler.handleAfterDelete(Trigger.old);
    }
}

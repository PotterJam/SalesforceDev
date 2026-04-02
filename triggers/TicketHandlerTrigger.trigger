trigger TicketHandlerTrigger on Ticket_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

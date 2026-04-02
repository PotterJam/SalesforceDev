trigger TicketDispatchTrigger on Ticket_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

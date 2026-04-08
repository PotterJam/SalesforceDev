trigger TicketDeltaTrigger on Ticket_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

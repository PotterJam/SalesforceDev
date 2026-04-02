trigger TicketResponseTrigger on Ticket_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketResponseHandler.handleAfterDelete(Trigger.old);
    }
}

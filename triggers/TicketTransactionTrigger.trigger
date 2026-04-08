trigger TicketTransactionTrigger on Ticket_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTransactionHandler.handleAfterDelete(Trigger.old);
    }
}

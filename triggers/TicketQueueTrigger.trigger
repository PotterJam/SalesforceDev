trigger TicketQueueTrigger on Ticket_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketQueueHandler.handleAfterDelete(Trigger.old);
    }
}

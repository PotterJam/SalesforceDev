trigger TicketJobTrigger on Ticket_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketJobHandler.handleAfterDelete(Trigger.old);
    }
}

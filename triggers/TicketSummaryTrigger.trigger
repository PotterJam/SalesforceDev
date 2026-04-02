trigger TicketSummaryTrigger on Ticket_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSummaryHandler.handleAfterDelete(Trigger.old);
    }
}

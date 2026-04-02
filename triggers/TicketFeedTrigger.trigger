trigger TicketFeedTrigger on Ticket_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketFeedHandler.handleAfterDelete(Trigger.old);
    }
}

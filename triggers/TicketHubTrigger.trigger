trigger TicketHubTrigger on Ticket_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHubHandler.handleAfterDelete(Trigger.old);
    }
}

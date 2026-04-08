trigger TicketHookTrigger on Ticket_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketHookHandler.handleAfterDelete(Trigger.old);
    }
}

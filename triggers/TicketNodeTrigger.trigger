trigger TicketNodeTrigger on Ticket_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketNodeHandler.handleAfterDelete(Trigger.old);
    }
}

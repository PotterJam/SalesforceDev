trigger TicketConfigTrigger on Ticket_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketConfigHandler.handleAfterDelete(Trigger.old);
    }
}

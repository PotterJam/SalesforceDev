trigger TicketItemTrigger on Ticket_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketItemHandler.handleAfterDelete(Trigger.old);
    }
}

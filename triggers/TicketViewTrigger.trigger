trigger TicketViewTrigger on Ticket_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketViewHandler.handleAfterDelete(Trigger.old);
    }
}

trigger TicketPlanTrigger on Ticket_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPlanHandler.handleAfterDelete(Trigger.old);
    }
}

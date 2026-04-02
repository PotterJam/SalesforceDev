trigger TicketTrackerTrigger on Ticket_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTrackerHandler.handleAfterDelete(Trigger.old);
    }
}

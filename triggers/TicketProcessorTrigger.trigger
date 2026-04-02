trigger TicketProcessorTrigger on Ticket_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

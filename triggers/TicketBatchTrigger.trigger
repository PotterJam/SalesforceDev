trigger TicketBatchTrigger on Ticket_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketBatchHandler.handleAfterDelete(Trigger.old);
    }
}

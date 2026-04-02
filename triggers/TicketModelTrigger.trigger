trigger TicketModelTrigger on Ticket_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketModelHandler.handleAfterDelete(Trigger.old);
    }
}

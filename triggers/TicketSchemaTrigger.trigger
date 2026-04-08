trigger TicketSchemaTrigger on Ticket_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSchemaHandler.handleAfterDelete(Trigger.old);
    }
}

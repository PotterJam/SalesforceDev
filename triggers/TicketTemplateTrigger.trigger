trigger TicketTemplateTrigger on Ticket_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketTemplateHandler.handleAfterDelete(Trigger.old);
    }
}

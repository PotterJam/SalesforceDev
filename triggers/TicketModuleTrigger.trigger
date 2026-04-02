trigger TicketModuleTrigger on Ticket_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketModuleHandler.handleAfterDelete(Trigger.old);
    }
}

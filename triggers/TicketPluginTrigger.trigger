trigger TicketPluginTrigger on Ticket_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPluginHandler.handleAfterDelete(Trigger.old);
    }
}

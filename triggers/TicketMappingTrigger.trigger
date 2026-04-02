trigger TicketMappingTrigger on Ticket_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketMappingHandler.handleAfterDelete(Trigger.old);
    }
}

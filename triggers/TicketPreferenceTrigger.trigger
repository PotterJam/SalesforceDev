trigger TicketPreferenceTrigger on Ticket_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}

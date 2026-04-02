trigger TicketBackupTrigger on Ticket_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketBackupHandler.handleAfterDelete(Trigger.old);
    }
}

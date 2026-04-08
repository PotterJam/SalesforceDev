trigger TicketSnapshotTrigger on Ticket_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}

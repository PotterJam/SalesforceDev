trigger TicketStageTrigger on Ticket_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketStageHandler.handleAfterDelete(Trigger.old);
    }
}

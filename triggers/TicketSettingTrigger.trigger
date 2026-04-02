trigger TicketSettingTrigger on Ticket_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TicketSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TicketSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TicketSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TicketSettingHandler.handleAfterDelete(Trigger.old);
    }
}

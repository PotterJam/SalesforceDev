trigger PartnerHandlerTrigger on Partner_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerHandlerHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PartnerLogTrigger on Partner_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerLogHandler.handleAfterDelete(Trigger.old);
    }
}

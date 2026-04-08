trigger PartnerProcessTrigger on Partner_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerProcessHandler.handleAfterDelete(Trigger.old);
    }
}

trigger SupportDeltaTrigger on Support_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ReviewDeltaTrigger on Review_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

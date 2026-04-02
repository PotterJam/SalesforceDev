trigger IndexDeltaTrigger on Index_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

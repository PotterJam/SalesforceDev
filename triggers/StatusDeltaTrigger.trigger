trigger StatusDeltaTrigger on Status_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

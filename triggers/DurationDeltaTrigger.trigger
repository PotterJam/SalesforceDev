trigger DurationDeltaTrigger on Duration_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

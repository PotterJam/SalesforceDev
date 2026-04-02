trigger IssueDeltaTrigger on Issue_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

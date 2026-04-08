trigger RangeDeltaTrigger on Range_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

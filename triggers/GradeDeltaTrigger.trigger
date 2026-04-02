trigger GradeDeltaTrigger on Grade_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

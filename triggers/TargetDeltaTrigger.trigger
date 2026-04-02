trigger TargetDeltaTrigger on Target_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDeltaHandler.handleAfterDelete(Trigger.old);
    }
}

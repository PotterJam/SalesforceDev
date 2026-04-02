trigger TargetDetailTrigger on Target_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDetailHandler.handleAfterDelete(Trigger.old);
    }
}

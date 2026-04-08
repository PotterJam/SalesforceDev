trigger GradeHubTrigger on Grade_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeHubHandler.handleAfterDelete(Trigger.old);
    }
}

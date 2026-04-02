trigger GradeHookTrigger on Grade_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeHookHandler.handleAfterDelete(Trigger.old);
    }
}

trigger GradeJobTrigger on Grade_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeJobHandler.handleAfterDelete(Trigger.old);
    }
}

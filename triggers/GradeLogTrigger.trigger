trigger GradeLogTrigger on Grade_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeLogHandler.handleAfterDelete(Trigger.old);
    }
}

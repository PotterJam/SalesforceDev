trigger GradeArchiveTrigger on Grade_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeArchiveHandler.handleAfterDelete(Trigger.old);
    }
}

trigger GradeRequestTrigger on Grade_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRequestHandler.handleAfterDelete(Trigger.old);
    }
}

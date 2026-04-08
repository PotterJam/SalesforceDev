trigger GradeResponseTrigger on Grade_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeResponseHandler.handleAfterDelete(Trigger.old);
    }
}

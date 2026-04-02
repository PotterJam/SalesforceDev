trigger GradeServiceTrigger on Grade_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeServiceHandler.handleAfterDelete(Trigger.old);
    }
}

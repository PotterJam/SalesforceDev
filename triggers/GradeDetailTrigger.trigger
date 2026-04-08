trigger GradeDetailTrigger on Grade_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDetailHandler.handleAfterDelete(Trigger.old);
    }
}

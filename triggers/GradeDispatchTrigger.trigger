trigger GradeDispatchTrigger on Grade_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

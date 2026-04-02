trigger GradeManagerTrigger on Grade_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeManagerHandler.handleAfterDelete(Trigger.old);
    }
}

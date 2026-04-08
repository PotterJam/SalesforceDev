trigger GradeActionTrigger on Grade_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeActionHandler.handleAfterDelete(Trigger.old);
    }
}

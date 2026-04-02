trigger GradeViewTrigger on Grade_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeViewHandler.handleAfterDelete(Trigger.old);
    }
}

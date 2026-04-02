trigger GradeControllerTrigger on Grade_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeControllerHandler.handleAfterDelete(Trigger.old);
    }
}

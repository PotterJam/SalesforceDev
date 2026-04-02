trigger GradeFilterTrigger on Grade_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeFilterHandler.handleAfterDelete(Trigger.old);
    }
}

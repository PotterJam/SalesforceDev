trigger GradeQueueTrigger on Grade_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeQueueHandler.handleAfterDelete(Trigger.old);
    }
}

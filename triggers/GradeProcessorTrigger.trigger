trigger GradeProcessorTrigger on Grade_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

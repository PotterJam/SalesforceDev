trigger RatingProcessorTrigger on Rating_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

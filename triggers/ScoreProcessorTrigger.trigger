trigger ScoreProcessorTrigger on Score_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

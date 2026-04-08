trigger ResearchProcessorTrigger on Research_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

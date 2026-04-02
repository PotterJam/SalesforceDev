trigger ResolutionProcessorTrigger on Resolution_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

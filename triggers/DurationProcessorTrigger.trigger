trigger DurationProcessorTrigger on Duration_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

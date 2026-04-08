trigger ProjectProcessorTrigger on Project_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

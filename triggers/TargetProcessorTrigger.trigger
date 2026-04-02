trigger TargetProcessorTrigger on Target_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetProcessorHandler.handleAfterDelete(Trigger.old);
    }
}

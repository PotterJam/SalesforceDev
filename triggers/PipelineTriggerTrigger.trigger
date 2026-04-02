trigger PipelineTriggerTrigger on Pipeline_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

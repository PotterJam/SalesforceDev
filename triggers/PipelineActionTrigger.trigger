trigger PipelineActionTrigger on Pipeline_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineActionHandler.handleAfterDelete(Trigger.old);
    }
}

trigger PipelineRelayTrigger on Pipeline_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineRelayHandler.handleAfterDelete(Trigger.old);
    }
}

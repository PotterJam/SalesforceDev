trigger PipelineGatewayTrigger on Pipeline_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineGatewayHandler.handleAfterDelete(Trigger.old);
    }
}

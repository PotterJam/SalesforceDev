trigger PipelineAggregateTrigger on Pipeline_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

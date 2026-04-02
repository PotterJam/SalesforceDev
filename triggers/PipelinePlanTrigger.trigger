trigger PipelinePlanTrigger on Pipeline_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelinePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelinePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelinePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelinePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelinePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelinePlanHandler.handleAfterDelete(Trigger.old);
    }
}

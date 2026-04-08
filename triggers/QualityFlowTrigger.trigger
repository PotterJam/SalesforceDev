trigger QualityFlowTrigger on Quality_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityFlowHandler.handleAfterDelete(Trigger.old);
    }
}

trigger ThresholdFlowTrigger on Threshold_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdFlowHandler.handleAfterDelete(Trigger.old);
    }
}

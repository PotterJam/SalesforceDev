trigger RatioFlowTrigger on Ratio_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioFlowHandler.handleAfterDelete(Trigger.old);
    }
}

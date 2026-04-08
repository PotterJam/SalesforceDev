trigger MilestoneFlowTrigger on Milestone_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFlowHandler.handleAfterDelete(Trigger.old);
    }
}

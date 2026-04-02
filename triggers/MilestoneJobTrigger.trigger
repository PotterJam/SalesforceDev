trigger MilestoneJobTrigger on Milestone_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneJobHandler.handleAfterDelete(Trigger.old);
    }
}

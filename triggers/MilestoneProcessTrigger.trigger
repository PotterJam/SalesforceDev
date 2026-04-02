trigger MilestoneProcessTrigger on Milestone_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneProcessHandler.handleAfterDelete(Trigger.old);
    }
}

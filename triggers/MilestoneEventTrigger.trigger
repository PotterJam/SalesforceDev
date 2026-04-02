trigger MilestoneEventTrigger on Milestone_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneEventHandler.handleAfterDelete(Trigger.old);
    }
}

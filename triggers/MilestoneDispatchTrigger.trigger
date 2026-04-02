trigger MilestoneDispatchTrigger on Milestone_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneDispatchHandler.handleAfterDelete(Trigger.old);
    }
}

trigger MilestoneFilterTrigger on Milestone_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFilterHandler.handleAfterDelete(Trigger.old);
    }
}

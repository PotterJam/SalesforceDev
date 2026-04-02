trigger MilestoneDetailTrigger on Milestone_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneDetailHandler.handleAfterDelete(Trigger.old);
    }
}

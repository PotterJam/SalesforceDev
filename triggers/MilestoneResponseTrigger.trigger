trigger MilestoneResponseTrigger on Milestone_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneResponseHandler.handleAfterDelete(Trigger.old);
    }
}

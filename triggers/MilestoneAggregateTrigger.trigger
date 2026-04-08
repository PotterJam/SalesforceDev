trigger MilestoneAggregateTrigger on Milestone_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneAggregateHandler.handleAfterDelete(Trigger.old);
    }
}

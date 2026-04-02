trigger MilestoneBindingTrigger on Milestone_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBindingHandler.handleAfterDelete(Trigger.old);
    }
}

trigger MilestoneRegistryTrigger on Milestone_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneRegistryHandler.handleAfterDelete(Trigger.old);
    }
}

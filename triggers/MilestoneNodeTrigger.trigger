trigger MilestoneNodeTrigger on Milestone_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneNodeHandler.handleAfterDelete(Trigger.old);
    }
}

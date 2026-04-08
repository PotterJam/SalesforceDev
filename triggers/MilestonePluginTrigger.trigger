trigger MilestonePluginTrigger on Milestone_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestonePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestonePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestonePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestonePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestonePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestonePluginHandler.handleAfterDelete(Trigger.old);
    }
}

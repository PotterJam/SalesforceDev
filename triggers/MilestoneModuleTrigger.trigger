trigger MilestoneModuleTrigger on Milestone_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneModuleHandler.handleAfterDelete(Trigger.old);
    }
}

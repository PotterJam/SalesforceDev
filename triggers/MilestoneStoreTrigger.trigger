trigger MilestoneStoreTrigger on Milestone_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneStoreHandler.handleAfterDelete(Trigger.old);
    }
}

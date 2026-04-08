trigger MilestoneModelTrigger on Milestone_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneModelHandler.handleAfterDelete(Trigger.old);
    }
}

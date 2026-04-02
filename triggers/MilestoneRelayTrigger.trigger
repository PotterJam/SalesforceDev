trigger MilestoneRelayTrigger on Milestone_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneRelayHandler.handleAfterDelete(Trigger.old);
    }
}

trigger MilestoneGatewayTrigger on Milestone_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneGatewayHandler.handleAfterDelete(Trigger.old);
    }
}

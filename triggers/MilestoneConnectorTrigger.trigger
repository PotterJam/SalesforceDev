trigger MilestoneConnectorTrigger on Milestone_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneConnectorHandler.handleAfterDelete(Trigger.old);
    }
}

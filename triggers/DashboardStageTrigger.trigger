trigger DashboardStageTrigger on Dashboard_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardStageHandler.handleAfterDelete(Trigger.old);
    }
}

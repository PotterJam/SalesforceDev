trigger CoverageHubTrigger on Coverage_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHubHandler.handleAfterDelete(Trigger.old);
    }
}

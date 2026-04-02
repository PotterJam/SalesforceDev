trigger DurationHubTrigger on Duration_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationHubHandler.handleAfterDelete(Trigger.old);
    }
}

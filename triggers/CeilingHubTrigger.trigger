trigger CeilingHubTrigger on Ceiling_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingHubHandler.handleAfterDelete(Trigger.old);
    }
}

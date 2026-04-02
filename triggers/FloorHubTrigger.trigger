trigger FloorHubTrigger on Floor_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorHubHandler.handleAfterDelete(Trigger.old);
    }
}

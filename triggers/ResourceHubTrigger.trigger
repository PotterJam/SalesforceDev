trigger ResourceHubTrigger on Resource_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceHubHandler.handleAfterDelete(Trigger.old);
    }
}

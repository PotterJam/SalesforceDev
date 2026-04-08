trigger ProductHubTrigger on Product_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductHubHandler.handleAfterDelete(Trigger.old);
    }
}

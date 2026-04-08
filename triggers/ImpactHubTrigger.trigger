trigger ImpactHubTrigger on Impact_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactHubHandler.handleAfterDelete(Trigger.old);
    }
}

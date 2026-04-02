trigger ImpactTriggerTrigger on Impact_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

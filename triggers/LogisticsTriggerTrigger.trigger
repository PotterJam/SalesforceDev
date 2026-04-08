trigger LogisticsTriggerTrigger on Logistics_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

trigger QualityTriggerTrigger on Quality_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityTriggerHandler.handleAfterDelete(Trigger.old);
    }
}

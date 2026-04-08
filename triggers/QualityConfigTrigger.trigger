trigger QualityConfigTrigger on Quality_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityConfigHandler.handleAfterDelete(Trigger.old);
    }
}
